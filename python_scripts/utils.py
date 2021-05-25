# -*- coding: utf-8 -*-
"""
Created on Thu Apr 22 20:41:33 2021

@author: Arash
"""
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
from itertools import product as prd
import random
import json
from tqdm import tqdm
import yaml
from pathlib import Path
from dataclasses import dataclass
from dataclasses import replace as rpc


@dataclass
class IpLoc():
    """data class for handling LUT locations for an IP"""
    architecture_path: Path
    remaining_resources: np.ndarray = np.zeros(1)
    _lut_a: np.ndarray = np.zeros(1)
    lut_b: np.ndarray = np.zeros(1)
    lut_c: np.ndarray = np.zeros(1)
    lut_d: np.ndarray = np.zeros(1)
    slice_l: list = None
    slice_m: list = None
    slice_non: list = None
    max_x: int = 0
    max_y: int = 0

    def __post_init__(self):
        with open(self.architecture_path) as f:
            architecture = json.loads(f.read())
        self.max_x = architecture['MAX'][0]+1
        self.max_y = architecture['MAX'][1]+1
        self.remaining_resources = np.zeros((self.max_x, self.max_y))
        for item in architecture['N']:
            self.remaining_resources[item[0], item[1]] = -1
        self._lut_a = self.remaining_resources.copy()
        self.lut_b = self.remaining_resources.copy()
        self.lut_c = self.remaining_resources.copy()
        self.lut_d = self.remaining_resources.copy()
        self.slice_l = architecture['L']
        self.slice_m = architecture['M']
        self.slice_non = architecture['N']

    @property
    def lut_a(self) -> str:
        return self._lut_a

    @lut_a.setter
    def lut_a(self, lut_a: np.ndarray) -> None:
        assert self.max_x, self.max_y == lut_a.shape
        for item in self.slice_non:
            assert lut_a[item[0], item[1]] == 0
        self.remaining_resources -= np.array([self._lut_a > 0]).reshape(self.max_x, self.max_y)
        self._lut_a = lut_a
        self.remaining_resources += np.array([self._lut_a > 0]).reshape(self.max_x, self.max_y)

    def Sum(self) -> int:
        return (self.remaining_resources[self.remaining_resources > 0]).sum()

    def plot_layout(self, savefig='NO'):
        """Plots the FPGA resource usage"""
        a = np.copy(self.remaining_resources)
        a = a.T
        for i in self.slice_l:
            if a[i[1], i[0]] == 0:
                a[i[1], i[0]] = -1
            elif a[i[1], i[0]] == -1:
                a[i[1], i[0]] = 0
        for i in self.slice_m:
            if a[i[1], i[0]] == 0:
                a[i[1], i[0]] = -2
            elif a[i[1], i[0]] == -1:
                a[i[1], i[0]] = 0
        for i in self.slice_non:
            a[i[1], i[0]] = 0
        cmap = plt.cm.jet
        cmaplist = ["b", "yellowgreen", "gray", "lightsalmon", "salmon", "red", "brown"]
        cmap = matplotlib.colors.ListedColormap(cmaplist)
        norm = matplotlib.colors.BoundaryNorm(np.arange(-2.5, 5), cmap.N)
        fig = plt.figure()
        ax = fig.add_subplot(111)
        cax = ax.matshow(a, origin='lower', cmap=cmap, norm=norm)
        ax.set_xlabel('X (loc)')
        ax.set_ylabel('Y (loc)')
        cb = fig.colorbar(cax, ticks=[-2, -1, 0, 1, 2, 3, 4])
        cb.ax.set_yticklabels(['SliceM', 'SliceL', 'NA', '1-LUT', '2-LUT', '3-LUT', '4-LUT'])
        plt.show()

    @classmethod
    def add_resource_usage(cls, first_instance, other_instance):
        result = first_instance.remaining_resources + other_instance.remaining_resources
        assert result[result > 4].sum(
        ) == 0, "Some slices use more than 4 LUTs which is not allowed"
        result[result < 0] = -1
        return result


@dataclass
class TestCircuit():
    yaml_path: Path
    circuit: list = None

    def __post_init__(self):
        with open(self.yaml_path, 'r') as file:
            self.circuit = yaml.full_load(file)
        print(f'There are a total of {len(self.circuit.keys())} IPs in this design.')
        for item in self.circuit.keys():
            if self.circuit[item]['IP'] == 'RO':
                self.circuit[item]['IP_specs']['first_instance_name'] = (
                    self.circuit[item]['IP_specs']['first_instance_name'].replace('#', '@inst1')
                )
                self.circuit[item]['IP_specs']['other_instance_names'] = (
                    self.circuit[item]['IP_specs']['other_instance_names'].replace(
                        '#', '@inst1', 1).replace('#', '@inst2', 1)
                )
                self.circuit[item]['IP_specs']['feedback_signal'] = (
                    self.circuit[item]['IP_specs']['feedback_signal'].replace('#', '@inst2')
                )
            if self.circuit[item]['IP'] == 'BTI':
                self.circuit[item]['IP_specs']['first_instance_name'] = (
                    self.circuit[item]['IP_specs']['first_instance_name'].replace('#', '@inst1')
                )
                self.circuit[item]['IP_specs']['other_instance_names'] = (
                    self.circuit[item]['IP_specs']['other_instance_names'].replace(
                        '#', '@inst1', 1).replace('#', '@inst2', 1)
                )
                self.circuit[item]['IP_specs']['feedback_signal'] = (
                    self.circuit[item]['IP_specs']['feedback_signal'].replace('#', '@inst2')
                )
            if self.circuit[item]['IP'] == 'heater':
                self.circuit[item]['IP_specs']['SHE_instance_name'] = (
                    self.circuit[item]['IP_specs']['SHE_instance_name'].replace(
                        '#', '@inst1').replace('#', '@inst2', 1)
                )
                self.circuit[item]['IP_specs']['feedback_signal'] = (
                    self.circuit[item]['IP_specs']['feedback_signal'].replace(
                        '#', '@inst1', 1).replace('#', '@inst2', 1)
                )


class Constraints(object):
    """
    This is the main class to produce a set of constraints for ROs SHEs and other sensors.

    ...

    Attributes
    ----------
    architecture_path : str
        path to FPGA architecture json dict

    Methods
    -------
    """

    def __init__(self, first_instance_names, other_instance_names, feedback_signal,
                 IpLoc_data, num_oscillators, num_stages=4):
        """
        Parameters
        ----------
        num_stage : int
            number of stages including the pass lUT if there is one
        """
        self.first_instance_names = first_instance_names
        self.other_instance_names = other_instance_names
        self.feedback_signal = feedback_signal
        self.num_stages = num_stages
        self.IpLoc_data = IpLoc_data
        self._outputfile = "constraints.XDC"
        self._max_x, self._max_y = IpLoc_data.remaining_resources.shape
        self.num_oscillators = num_oscillators
        assert 'IpLoc' in str(type(self.IpLoc_data)), "IpLoc_data must be an IpLoc object"

    def RO_location(self):
        """
        For location constraints

        Parameters
        ----------
        """
        per_lut_data = [self.IpLoc_data.lut_a, self.IpLoc_data.lut_b,
                        self.IpLoc_data.lut_c, self.IpLoc_data.lut_d]
        lut_types = ['A', 'B', 'C', 'D']
        ROs = [self.num_stages for i in range(self.num_oscillators)]
        str1 = 'set_property BEL '
        str2 = '6LUT [get_cells '
        str4 = 'set_property LOC SLICE_'
        with open(self._outputfile, "a") as file:
            for lut_data, lut_type in zip(per_lut_data, lut_types):
                for x in range(self._max_x):
                    for y in range(self._max_y):
                        if lut_data[x, y] > 0:
                            ro_idx = int(lut_data[x, y])
                            ROs[ro_idx] -= 1
                            if len(self.first_instance_names) > 1:
                                if ROs[ro_idx] == 0:
                                    str3 = self.first_instance_names.replace(
                                        '@inst1', str(ro_idx)
                                    ).replace(
                                        '@inst2', str(ROs[ro_idx] - 1)
                                    ) + ']'
                                else:
                                    str3 = '{' + self.other_instance_names.replace(
                                        '@inst1', str(ro_idx)
                                    ).replace(
                                        '@inst2', str(ROs[ro_idx] - 1)
                                    ) + '}' + ']'
                            else:
                                str3 = '{' + self.other_instance_names.replace(
                                    '@inst1', str(ro_idx)
                                ).replace(
                                    '@inst2', str(ROs[ro_idx] - 1)
                                ) + '}' + ']'
                            str5 = f'X{x}Y{y} [get_cells '
                            file.write(str1 + lut_type + str2 + str3 + "\n")
                            file.write(str4 + str5 + str3 + "\n")

    def loops(self):
        """
        This function generates contraints to supress combinational loop errors.
        """

        with open(self._outputfile, "a") as file:
            file.write("\n")
            for ROs in range(self.num_oscillators * self.num_stages):
                file.write(
                    "set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets {" +
                    self.other_instance_names.replace(
                        '@inst1', str(ROs // self.num_stages)
                    ).replace('@inst2', str(ROs % self.num_stages)) + '}' + ']' + "\n"
                )


def fill(ipLoc_data, test_circuit, init_coord=(0, 0), dim=(24, 24)):
    """
    Fill up all of the available resources in a given block,
    this function helps with heater placement
    This function supports more than one heater IP but the dimentions of these heaters
    must be the same

    parameters
    ----------
    IpLoc_data IpLoc: resources available for placement (0)
    and forbidden spots (-1)

    init_coord int tuple: starting corrdinateion (x, y)

    dim int tuple: dimensions of the block

    return
    ------
    list of IpLoc: proposed heater block placement
    """
    heater_placements = []
    for circuit in test_circuit.keys():
        if test_circuit[circuit]['IP'] == 'heater':
            num_block = test_circuit[circuit]['IP_specs']['num_block']
            block_size = test_circuit[circuit]['IP_specs']['block_size']
            assert dim[0] * dim[1] == (
                num_block * block_size // 4
            ), 'dimensions do not math the number of SHEs per IP config file'
            SHE_list = list(range(num_block * block_size // 4))
            random.shuffle(SHE_list)
            lut_placement = rpc(ipLoc_data)
            y_dim = dim[1]
            y = init_coord[1]
            lst_indx = 0
            while y_dim > 0:
                x_dim = dim[0]
                x = init_coord[0]
                while x_dim > 0:
                    if lut_placement.remaining_resources[x, y] == 0:
                        lut_placement.remaining_resources[x, y] = 4
                        # shuffling the SHE locations
                        lst_indx += 1
                        lut_placement.lut_a[x, y] = SHE_list[lst_indx] // block_size
                        lut_placement.lut_b[x, y] = SHE_list[lst_indx] // block_size
                        lut_placement.lut_c[x, y] = SHE_list[lst_indx] // block_size
                        lut_placement.lut_d[x, y] = SHE_list[lst_indx] // block_size
                        # End shuffling the SHE locations
                        x_dim -= 1
                    x += 1
                y_dim -= 1
                y += 1
            heater_placements.append(lut_placement)
    if len(heater_placements) == 1:
        return lut_placement
    return heater_placements


def check_and_propose(lut_placement, slice_type='L'):
    """
    checks whether a proposed placement satisfies the slice type condition
    and if it doesn't propose a new placement. To forbid the plancement on
    a certain location set it to a negative number (-1).

    parameters
    ----------
    lut_placement IpLoc: desired placement

    slice_type str: desired slice type 'L', 'M', 'ALL'

    return
    ------
    IpLoc: proposed placement that satisfies the slice condition
    """

    output = rpc(lut_placement)
    if slice_type == 'ALL':
        type_values = lut_placement.slice_l + lut_placement.slice_m
    elif slice_type == 'L':
        type_values = lut_placement.slice_l
    elif slice_type == 'M':
        type_values = lut_placement.slice_m
    max_x, max_y = lut_placement.remaining_resources.shape
    for i in tqdm(range(max_x)):
        for j in range(max_y):
            if lut_placement[i, j] > 0:
                delta = 1
                x = i
                y = j
                while [x, y] not in type_values:
                    output[i, j] = 0 if output[i, j] > 0 else output[i, j]
                    delta_x_list = list(range(-delta, delta))
                    delta_y_list = delta_x_list
                    random.shuffle(delta_x_list)
                    random.shuffle(delta_y_list)
                    for delta_x, delta_y in prd(delta_x_list, delta_y_list):
                        if (
                            (i + delta_x <= architecture['MAX'][0]) and
                            (j + delta_y <= architecture['MAX'][1]) and
                            (0 <= i + delta_x) and
                            (0 <= j + delta_y)
                        ):
                            x = i + delta_x
                            y = j + delta_y
                            if (
                                ([x, y] in type_values) and
                                (output[x, y] == 0)
                            ):
                                output[x, y] = lut_placement[i, j]
                                break
                            else:
                                x = i
                                y = j
                    delta += 1
    # output[output < 0] = 0
    resource_usage = np.copy(output)
    plot_layout(resource_usage)
    return output


def heater_xdc(
        locations, Num_Blocks=64, Block_Size=36,
        outputfile='heater.XDC', architecture_path='ZYNQ7000.json'
):
    """
    Create constraints for the heater IP for TestChip design.

    parameters
    ----------
    Num_Blocks int: As per heater IP

    Block_Size int: As per heater IP

    start_location (int, int):

    locations nparray:

    architecture_path str:

    return
    ------
    None
    """
    locations[locations < 0] = 0
    assert (
        locations.sum() == Block_Size * Num_Blocks
    ), "Block_Size*Num_Blocks should match the number of inverters!"
    locations = check_and_propose(locations, slice_type='ALL')
    a = Constraints(
        first_instance_names='',
        other_instance_names='design_1_i/heater/inst/SHE_block[@inst1].SHE[@inst2].SHE/LUT6_inst',
        max_loop1=Block_Size, num_stages=Block_Size*Num_Blocks, shape=locations,
        lut_type="ALL", shuffle="YES",
        architecture_path='ZYNQ7000.json'
    )
    a._outputfile = outputfile
    a.RO_location()
    a = Constraints(
        first_instance_names='',
        other_instance_names='design_1_i/heater/inst/SHE_block[@inst1].SHE[@inst2].SHE/feedback',
        max_loop1=Block_Size, num_stages=Block_Size*Num_Blocks, shape=locations,
        lut_type="ALL", shuffle="YES",
        architecture_path='ZYNQ7000.json'
    )
    a._outputfile = outputfile
    a.loops()
    return locations


def RO_xdc(
        Num_Oscillators, Num_Stages, locations, outputfile='ROs.XDC',
        slice_type='L', json_output='RO_locations.json'
):
    """
    Create constraints for the RO IP for TestChip design.

    parameters
    ----------
    Num_Oscillators int: As per RO IP

    Num_Stages int: As per RO IP (inverters + auxilary stages per RO)

    locations nparray:

    slice_type str:

    return
    ------
    None
    """
    Num_Stages += 1
    locations[locations < 0] = 0
    assert (
        locations.sum() == Num_Oscillators * Num_Stages
    ), "Block_Size*Num_Blocks should match the number of inverters!"
    number_of_instances = np.ceil(Num_Oscillators / 32).astype(int)
    RO_locations = dict()
    RO_num = 0
    output = locations * 0
    for i in range(number_of_instances):
        instance_name = f'RO{i}'
        instance_num_oscillators = 32 if (
            number_of_instances-1-i > 0
        ) else (Num_Oscillators-32*(i))
        count = 0
        loc_copy = np.copy(locations)
        for x in range(locations.shape[0]):
            for y in range(locations.shape[1]):
                if count == (instance_num_oscillators*Num_Stages):
                    loc_copy[x, y] = 0
                count += loc_copy[x, y]
                if loc_copy[x, y] > 0:
                    locations[x, y] = 0
                    RO_locations[RO_num] = (x, y)
                    RO_num += 1
        location = check_and_propose(loc_copy, slice_type)
        output += location
        a = Constraints(
            first_instance_names=f'design_1_i/{instance_name}/'
            'inst/RO[@inst1].nolabel_line95/LUT6_2_inst',
            other_instance_names=f'design_1_i/{instance_name}/inst/RO'
            '[@inst1].notGate[@inst2].Inverter/LUT6_inst',
            max_loop1=Num_Stages, num_stages=instance_num_oscillators*Num_Stages,
            shape=location, lut_type="ALL", shuffle="NO",
            architecture_path='ZYNQ7000.json'
        )
        a._outputfile = outputfile
        a.RO_location()
        a = Constraints(
            first_instance_names='',
            other_instance_names=f'design_1_i/{instance_name}/inst/'
            'RO[@inst2].notGate[0].Inverter/out_sig',
            max_loop1=instance_num_oscillators, num_stages=instance_num_oscillators,
            shape=np.array([instance_num_oscillators]), lut_type="ALL", shuffle="NO",
            architecture_path='ZYNQ7000.json'
        )
        a._outputfile = outputfile
        a.loops()
    with open(json_output, 'w') as file:
        json.dump(RO_locations, file)
    return output
# TODO: Fix the BTI sensor so that it fits my format here


def BTI_xdc(Num_Oscillators, locations, outputfile='BTI.XDC', slice_type='L'):
    """
    Create constraints for the BTI IP for TestChip design.

    parameters
    ----------
    Num_Oscillators int: As per heater IP

    return
    ------
    None
    """
    locations[locations < 0] = 0
    assert (
        locations.sum() == Num_Oscillators * 3
    ), "Block_Size*Num_Blocks should match the number of inverters!"
    number_of_instances = np.ceil(Num_Oscillators / 32).astype(int)
    BTI_locations = dict()
    BTI_num = 0
    for i in range(number_of_instances):
        # TODO: Apply the name convention to the TestChip class as well
        instance_name = f'BTI{i}'
        instance_num_oscillators = 31 if (
            number_of_instances-1-i > 0
        ) else (Num_Oscillators-31*(i))
        count = 0
        loc_copy = np.copy(locations)
        for x in range(locations.shape[0]):
            for y in range(locations.shape[1]):
                if count == (instance_num_oscillators*3):
                    loc_copy[x, y] = 0
                count += loc_copy[x, y]
                if loc_copy[x, y] > 0:
                    locations[x, y] = 0
                    BTI_locations[BTI_num] = (x, y)
                    BTI_num += 1
        locations = check_and_propose(loc_copy, slice_type)
        a = Constraints(
            first_instance_names=f'design_1_i/{instance_name}/inst/CRO[@inst1].NAND/LUT6_inst',
            other_instance_names=f'design_1_i/{instance_name}/inst/CRO[@inst1].Inverter@inst2',
            max_loop1=3, num_stages=instance_num_oscillators*3,
            shape=locations, lut_type="ALL", shuffle="NO",
            architecture_path='ZYNQ7000.json'
        )
        a._outputfile = outputfile
        a.RO_location()
        a = Constraints(
            first_instance_names='',
            other_instance_names=f'design_1_i/{instance_name}/inst/CRO[@inst2].Inverter0/in0[0]',
            max_loop1=instance_num_oscillators, num_stages=instance_num_oscillators,
            shape=np.array([instance_num_oscillators]), lut_type="ALL", shuffle="NO",
            architecture_path='ZYNQ7000.json'
        )
        a._outputfile = outputfile
        a.loops()
    with open('BTI_locations.json', 'w') as file:
        json.dump(BTI_locations, file)
    return locations


def chipresources(input_file='ZYNQ7000.json'):
    """
    Reads the architecture file and produces an ndarray with the dimentions of the input file.

    parameters
    ----------
    None

    return
    ------
    chipreseources ndarray
    """
    with open(input_file) as f:
        architecture = json.loads(f.read())
    chipreseources = np.zeros((architecture['MAX'][0]+1, architecture['MAX'][1]+1))
    for item in architecture['N']:
        chipreseources[item[0], item[1]] = -1
    plot_layout(chipreseources)
    num_l = len(architecture['L'])
    num_m = len(architecture['M'])
    print(f'Slice-L: {num_l}, Slice-M: {num_m}')
    return chipreseources


def create_constraints(yaml_path):
    """
    parameters
    ----------
    yaml_path Path: input file path
    """
