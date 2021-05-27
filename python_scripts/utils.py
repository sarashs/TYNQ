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
from collections import defaultdict


@dataclass
class IpLoc():
    """data class for handling LUT locations for an IP"""
    architecture_path: Path
    remaining_resources: np.ndarray = np.zeros(1)
    _lut_a: np.ndarray = np.zeros(1)
    _lut_b: np.ndarray = np.zeros(1)
    _lut_c: np.ndarray = np.zeros(1)
    _lut_d: np.ndarray = np.zeros(1)
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
        self._lut_a = -1 * np.ones((self.max_x, self.max_y))
        self._lut_b = -1 * np.ones((self.max_x, self.max_y))
        self._lut_c = -1 * np.ones((self.max_x, self.max_y))
        self._lut_d = -1 * np.ones((self.max_x, self.max_y))
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

    @property
    def lut_b(self) -> str:
        return self._lut_b

    @lut_b.setter
    def lut_b(self, lut_b: np.ndarray) -> None:
        assert self.max_x, self.max_y == lut_b.shape
        for item in self.slice_non:
            assert lut_b[item[0], item[1]] == 0
        self.remaining_resources -= np.array([self._lut_b > 0]).reshape(self.max_x, self.max_y)
        self._lut_b = lut_b
        self.remaining_resources += np.array([self._lut_b > 0]).reshape(self.max_x, self.max_y)

    @property
    def lut_c(self) -> str:
        return self._lut_c

    @lut_c.setter
    def lut_c(self, lut_c: np.ndarray) -> None:
        assert self.max_x, self.max_y == lut_c.shape
        for item in self.slice_non:
            assert lut_c[item[0], item[1]] == 0
        self.remaining_resources -= np.array([self._lut_c > 0]).reshape(self.max_x, self.max_y)
        self._lut_c = lut_c
        self.remaining_resources += np.array([self._lut_c > 0]).reshape(self.max_x, self.max_y)

    @property
    def lut_d(self) -> str:
        return self._lut_d

    @lut_d.setter
    def lut_d(self, lut_d: np.ndarray) -> None:
        assert self.max_x, self.max_y == lut_d.shape
        for item in self.slice_non:
            assert lut_d[item[0], item[1]] == 0
        self.remaining_resources -= np.array([self._lut_d > 0]).reshape(self.max_x, self.max_y)
        self._lut_d = lut_d
        self.remaining_resources += np.array([self._lut_d > 0]).reshape(self.max_x, self.max_y)

    def update_remaining_resources(self) -> None:
        for lut in [self._lut_a, self._lut_b, self._lut_c, self._lut_d]:
            self.remaining_resources += np.array([lut > 0]).reshape(self.max_x, self.max_y)

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

    @classmethod
    def block_resource(cls, first_instance, other_instance):
        """Sets slices that were used in other instance as prohibitted regions
        in the first instacne"""
        assert first_instance.remaining_resources[other_instance.remaining_resources > 0].sum(
        ) == 0, "Resources you want to block are in use."
        first_instance.remaining_resources[other_instance.remaining_resources > 0] = -1
        return first_instance

    def check_and_propose(self, slice_type='L'):
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

        output = rpc(self)
        if slice_type == 'ALL':
            type_values = self.slice_l + self.slice_m
        elif slice_type == 'L':
            type_values = self.slice_l
        elif slice_type == 'M':
            type_values = self.slice_m
        max_x = self.max_x
        max_y = self.max_y
        for i in tqdm(range(max_x)):
            for j in range(max_y):
                if self.remaining_resources[i, j] > 0:
                    delta = 1
                    x = i
                    y = j
                    while [x, y] not in type_values:
                        pair = zip([self.remaining_resources,
                                    self._lut_a,
                                    self._lut_b,
                                    self._lut_c,
                                    self._lut_d], [
                                   output.remaining_resources,
                                   output._lut_a,
                                   output._lut_b,
                                   output._lut_c,
                                   output._lut_d])
                        delta_x_list = list(range(-delta, delta))
                        delta_y_list = delta_x_list
                        random.shuffle(delta_x_list)
                        random.shuffle(delta_y_list)
                        for input_filed, output_field in pair:
                            output_field[i, j] = 0 if output_field[i, j] > 0 else output_field[i, j]
                            for delta_x, delta_y in prd(delta_x_list, delta_y_list):
                                if (
                                    (i + delta_x <= max_x) and
                                    (j + delta_y <= max_y) and
                                    (0 <= i + delta_x) and
                                    (0 <= j + delta_y)
                                ):
                                    x = i + delta_x
                                    y = j + delta_y
                                    if (
                                        ([x, y] in type_values) and
                                        (output_field[x, y] == -1) and
                                        (self.remaining_resources == 0)
                                    ):
                                        output_field[x, y] = input_filed[i, j]
                                        break
                                    else:
                                        x = i
                                        y = j
                            delta += 1
        # output[output < 0] = 0
        return output


@dataclass
class TestCircuit():
    yaml_path: Path
    circuit: dict = None
    locations: dict = None

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
        per_lut_data = [self.IpLoc_data._lut_a, self.IpLoc_data._lut_b,
                        self.IpLoc_data._lut_c, self.IpLoc_data._lut_d]
        lut_types = ['A', 'B', 'C', 'D']
        ROs = [self.num_stages for i in range(self.num_oscillators)]
        str1 = 'set_property BEL '
        str2 = '6LUT [get_cells '
        str4 = 'set_property LOC SLICE_'
        with open(self._outputfile, "a") as file:
            for lut_data, lut_type in zip(per_lut_data, lut_types):
                for x in range(self._max_x):
                    for y in range(self._max_y):
                        if lut_data[x, y] > -1:
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
                    self.feedback_signal.replace(
                        '@inst1', str(ROs // self.num_stages)
                    ).replace('@inst2', str(ROs % self.num_stages)) + '}' + ']' + "\n"
                )


def heaer_fill(test_circuit, init_coord=(0, 0), dim=(24, 24)):
    """
    Fill up all of the available resources in a given block,
    this function helps with heater placement
    This function supports more than one heater IP but the dimentions of these heaters
    must be the same

    parameters
    ----------
    test_circuit

    init_coord int tuple: starting corrdinateion (x, y)

    dim int tuple: dimensions of the block

    return
    ------
    list of IpLoc: proposed heater block placement
    """
    heater_placements = []
    for item in test_circuit.circuit.keys():
        if test_circuit.circuit[item]['IP'] == 'heater':
            num_block = test_circuit.circuit[item]['IP_specs']['num_block']
            block_size = test_circuit.circuit[item]['IP_specs']['block_size']
            num_slices = block_size // 4
            assert dim[0] * dim[1] == (
                num_block * num_slices
            ), 'dimensions do not math the number of SHEs per IP config file'
            SHE_list = list(range(num_block * num_slices))
            random.shuffle(SHE_list)
            lut_placement = rpc(test_circuit.locations)
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
                        lut_placement._lut_a[x, y] = SHE_list[lst_indx] // num_slices
                        lut_placement._lut_b[x, y] = SHE_list[lst_indx] // num_slices
                        lut_placement._lut_c[x, y] = SHE_list[lst_indx] // num_slices
                        lut_placement._lut_d[x, y] = SHE_list[lst_indx] // num_slices
                        # End shuffling the SHE locations
                        lst_indx += 1
                        x_dim -= 1
                    x += 1
                y_dim -= 1
                y += 1
            heater_placements.append(lut_placement)
    if len(heater_placements) == 1:
        return lut_placement
    return heater_placements


def heater_xdc(
        circuit_data, init_coord=(0, 0), dim=(24, 24),
        outputfile='heater.XDC'
):
    """
    Create constraints for the heater IP for TestChip design.
    This assumes only 1 haeter IP in the design

    parameters
    ----------

    circuit_data TestCircuit:

    start_location tuple (int, int):

    outputfile str:

    return
    ------
    None
    """
    heater_placements = heaer_fill(circuit_data, init_coord, dim)
    circuit = circuit_data.circuit
    for item in circuit.keys():
        if circuit[item]['IP'] == 'heater':
            instance_name = circuit[item]['IP_specs']['SHE_instance_name']
            feedback_signal = circuit[item]['IP_specs']['feedback_signal']
            block_size = circuit[item]['IP_specs']['block_size']
            num_block = circuit[item]['IP_specs']['num_block']
            constraints_object = Constraints(
                '', instance_name, feedback_signal, heater_placements, num_block, block_size)
            constraints_object._outputfile = outputfile
            constraints_object.RO_location()
            constraints_object.loops()


def RO_xdc(
        circuit_data, slice_type='L', outputfile='ROs.XDC',
        json_output='RO_locations.json'
):
    """
    Create constraints for the RO IP for TestChip design.

    parameters
    ----------

    circuit_data TestCircuit:

    slice_type str:

    outputfile str:

    json_output str:

    return
    ------
    None
    """

    circuit = circuit_data.circuit
    RO_locations = defaultdict(lambda: [])
    for item in circuit.keys():
        if circuit[item]['IP'] == 'RO':
            first_instance_name = circuit[item]['IP_specs']['first_instance_name']
            other_instance_names = circuit[item]['IP_specs']['other_instance_names']
            feedback_signal = circuit[item]['IP_specs']['feedback_signal']
            Num_Oscillators = circuit[item]['IP_specs']['Num_Oscillators']
            Num_Stages = circuit[item]['IP_specs']['Num_Stages'] + 1
            lut_placement = circuit_data.locations[item]
            lut_placement = lut_placement.check_and_propose(slice_type)
            constraints_object = Constraints(
                first_instance_name, other_instance_names, feedback_signal,
                lut_placement, Num_Oscillators, Num_Stages
            )
            constraints_object._outputfile = str(outputfile)
            constraints_object.RO_location()
            constraints_object.loops()
            per_IP_locations = dict()
            zipped = zip(['lut_a', 'lut_b', 'lut_c', 'lut_d'], [lut_placement._lut_a,
                         lut_placement._lut_b, lut_placement._lut_c, lut_placement._lut_d])
            for lut_str, lut in zipped:
                per_IP_locations[lut_str] = []
                for x in range(lut_placement.max_x):
                    for y in range(lut_placement.max_y):
                        if lut[x, y] > -1:
                            per_IP_locations[lut_str].append((lut[x, y], x, y))
            RO_locations[item] = per_IP_locations
    with open(json_output, 'w') as file:
        json.dump(RO_locations, file)


def BTI_xdc(
        circuit_data, slice_type='L', outputfile='BTIs.XDC',
        json_output='BTI_locations.json'
):
    """
    Create constraints for the BTI IP for TestChip design.

    parameters
    ----------
    Num_Oscillators int: As per heater IP

    return
    ------
    None
    """
    circuit = circuit_data.circuit
    RO_locations = defaultdict(lambda: [])
    for item in circuit.keys():
        if circuit[item]['IP'] == 'BTI':
            first_instance_name = circuit[item]['IP_specs']['first_instance_name']
            other_instance_names = circuit[item]['IP_specs']['other_instance_names']
            feedback_signal = circuit[item]['IP_specs']['feedback_signal']
            Num_Oscillators = circuit[item]['IP_specs']['Num_Oscillators']
            Num_Stages = 3
            lut_placement = circuit_data.locations[item]
            lut_placement = lut_placement.check_and_propose(slice_type)
            constraints_object = Constraints(
                first_instance_name, other_instance_names, feedback_signal,
                lut_placement, Num_Oscillators, Num_Stages
            )
            constraints_object._outputfile = str(outputfile)
            constraints_object.RO_location()
            constraints_object.loops()
            per_IP_locations = dict()
            zipped = zip(['lut_a', 'lut_b', 'lut_c', 'lut_d'], [lut_placement._lut_a,
                         lut_placement._lut_b, lut_placement._lut_c, lut_placement._lut_d])
            for lut_str, lut in zipped:
                per_IP_locations[lut_str] = []
                for x in range(lut_placement.max_x):
                    for y in range(lut_placement.max_y):
                        if lut[x, y] > -1:
                            per_IP_locations[lut_str].append((lut[x, y], x, y))
            RO_locations[item] = per_IP_locations
    with open(json_output, 'w') as file:
        json.dump(RO_locations, file)


def create_constraints(yaml_path):
    """
    parameters
    ----------
    yaml_path Path: input file path
    """
