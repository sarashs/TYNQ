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

    def __init__(
        self, first_instance_names='design_1_i/LUT6_RO_0/inst/Inverter/LUT6_inst',
        other_instance_names='design_1_i/LUT6_RO_0/inst/notGates[@inst].Inverter/LUT6_inst',
        max_loop1=1, num_stages=3, shape=np.array([[3, 0], [0, 0]]).astype(int),
        lut_type='ALL', shuffle="NO", architecture_path='ZYNQ7000.json'
    ):
        """
        Parameters
        ----------
        """
        self.first_instance_names = first_instance_names
        self.other_instance_names = other_instance_names
        self.max_loop1 = max_loop1
        self.num_stages = num_stages
        self.shape = shape.astype(int)  # num Slices in x * y
        self.lut_type = lut_type  # A, B, C, D, All
        # {generic_name : [num_RO, num_stages, location_tuple]} ; location_tuple = (x1, y1, x2, y2)
        self.shuffle = shuffle
        self.data_dict = {'x': [], 'y': [], 'A': [], 'B': [], 'C': [], 'D': []}
        self._outputfile = "constraints.XDC"
        with open(architecture_path) as f:
            self._architecture = json.loads(f.read())
        self._max_x = self._architecture['MAX'][0]
        self._max_y = self._architecture['MAX'][1]
        assert self.shape.sum() == num_stages

    def RO_location(self):
        """
        For location constraints

        Parameters
        ----------
        """
        lut_types = ['A', 'B', 'C', 'D']
        ROs = self.num_stages
        str1 = 'set_property BEL '
        str2 = '6LUT [get_cells '
        str4 = 'set_property LOC SLICE_'
        list_shape0 = list(range(self.shape.shape[0]))
        list_shape00 = []
        list_shape1 = list(range(self.shape.shape[1]))
        list_shape11 = []
        if "YES" in self.shuffle:
            print("Shuffling")
            for i in range(self.shape.shape[0]):
                j = random.choice(list_shape0)
                list_shape00.append(j)
                list_shape0.remove(j)
            for i in range(self.shape.shape[1]):
                j = random.choice(list_shape1)
                list_shape11.append(j)
                list_shape1.remove(j)
        else:
            list_shape00 = list_shape0
            list_shape11 = list_shape1
        with open(self._outputfile, "a") as file:
            for i in list_shape00:
                for j in list_shape11:
                    while self.shape[i][j] > 0:
                        self.shape[i][j] -= 1
                        ROs -= 1
                        if len(self.first_instance_names) > 1:
                            if ROs % self.max_loop1 == self.max_loop1 - 1:
                                str3 = self.first_instance_names.replace(
                                    '@inst1', str(ROs // self.max_loop1)
                                ).replace(
                                    '@inst2', str(ROs % self.max_loop1)
                                ) + ']'
                            else:
                                str3 = '{' + self.other_instance_names.replace(
                                    '@inst1', str(ROs // self.max_loop1)
                                ).replace(
                                    '@inst2', str(ROs % self.max_loop1)
                                ) + '}' + ']'
                        else:
                            str3 = '{' + self.other_instance_names.replace(
                                '@inst1', str(ROs // self.max_loop1)
                            ).replace(
                                '@inst2', str(ROs % self.max_loop1)
                            ) + '}' + ']'
                        if 'ALL' in self.lut_type.upper():
                            lut_type = lut_types[self.shape[i][j] % 4]
                        else:
                            lut_type = self.lut_type
                        str5 = f'X{i}Y{j} [get_cells '
                        file.write(str1 + lut_type + str2 + str3 + "\n")
                        file.write(str4 + str5 + str3 + "\n")

    def loops(self):
        """
        This function generates contraints to supress combinational loop errors.
        """

        with open(self._outputfile, "a") as file:
            file.write("\n")
            for ROs in range(self.num_stages):
                file.write(
                    "set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets {" +
                    self.other_instance_names.replace(
                        '@inst1', str(ROs // self.max_loop1)
                    ).replace('@inst2', str(ROs % self.max_loop1)) + '}' + ']' + "\n"
                )

    # TODO: take this out of the class
    def check_and_propose(self, lut_placement, slice_type='L'):
        """
        checks whether a proposed placement satisfies the slice type condition
        and if it doesn't propose a new placement. To prevent the plancement on
        a certain location set it to a negative number (-1).

        parameters
        ----------
        lut_placement nparray: desired placement shape

        slice_type str: desired slice type 'L', 'M', 'ALL'

        return
        ------
        nparray: proposed placement that satisfies the slice condition
        """
        assert lut_placement.shape[0] == self._max_x+1
        assert lut_placement.shape[1] == self._max_y+1
        output = np.copy(lut_placement)
        if slice_type.endswith('ALL'):
            slice_type = ['L', 'M']
        for i in range(self._max_x+1):
            for j in range(self._max_y+1):
                if lut_placement[i, j] > 0:
                    delta = 1
                    x = i
                    y = j
                    while self(x, y) not in slice_type:
                        output[i, j] = 0
                        for delta_x, delta_y in prd(
                            list(range(-delta, delta)), list(range(-delta, delta))
                        ):
                            if (
                                (i + delta_x <= self._max_x) and
                                (j + delta_y <= self._max_y) and
                                (0 <= i + delta_x) and
                                (0 <= j + delta_y)
                            ):
                                x = i + delta_x
                                y = j + delta_y
                                if (
                                    (self(x, y) in slice_type) and
                                    (output[x, y] == 0)
                                ):
                                    output[x, y] = lut_placement[i, j]
                                    break
                                else:
                                    x = i
                                    y = j
                        delta += 1
        output[output < 0] = 0
        a = np.copy(output)
        a = a.T
        for i in self._architecture['L']:
            if a[i[1], i[0]] == 0:
                a[i[1], i[0]] = -1
        for i in self._architecture['M']:
            if a[i[1], i[0]] == 0:
                a[i[1], i[0]] = -2
        for i in self._architecture['N']:
            assert a[i[1], i[0]] == 0
        cmap = plt.cm.jet
        cmaplist = ["b", "yellowgreen", "gray", "lightsalmon", "salmon", "red", "brown"]
        cmap = matplotlib.colors.ListedColormap(cmaplist)
        norm = matplotlib.colors.BoundaryNorm(np.arange(-2.5, 5), cmap.N)
        fig = plt.figure()
        ax = fig.add_subplot(111)
        cax = ax.matshow(a, origin='lower', cmap=cmap, norm=norm)
        cb = fig.colorbar(cax, ticks=[-2, -1, 0, 1, 2, 3, 4])
        cb.ax.set_yticklabels(['SliceM', 'SliceL', 'NA', '1-LUT', '2-LUT', '3-LUT', '4-LUT'])
        plt.show()
        return output

    def __call__(self, x, y):
        for item in self._architecture['N']:
            if x == item[0] and y == item[1]:
                return 'N'
        for item in self._architecture['L']:
            if x == item[0]:
                return 'L'
        for item in self._architecture['M']:
            if x == item[0]:
                return 'M'


def heater_xdc(
        locations, outputfile, Num_Blocks=64, Block_Size=36, architecture_path='ZYNQ7000.json'
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
    assert (
        sum(sum(locations)) == Block_Size * Num_Blocks
    ), "Block_Size*Num_Blocks should match the number of inverters!"
    a = Constraints(
        first_instance_names='',
        other_instance_names='design_1_i/heater/inst/SHE_block[@inst1].SHE[@inst2].SHE/LUT6_inst',
        max_loop1=Block_Size, num_stages=Block_Size*Num_Blocks, shape=locations,
        lut_type="ALL", shuffle="YES",
        architecture_path='ZYNQ7000.json'
    )
    a._outputfile = outputfile
    a.check_and_propose(locations, slice_type='ALL')
    a = Constraints(
        first_instance_names='',
        other_instance_names='design_1_i/heater/inst/SHE_block[@inst1].SHE[@inst2].SHE/feedback',
        max_loop1=Block_Size, num_stages=Block_Size*Num_Blocks, shape=locations,
        lut_type="ALL", shuffle="YES",
        architecture_path='ZYNQ7000.json'
    )
    a.RO_location()
    a.loops()


def RO_xdc(Num_Oscillators, Num_Stages, locations, slice_type='L'):
    """
    Create constraints for the RO IP for TestChip design.

    parameters
    ----------
    Num_Oscillators int: As per heater IP

    Num_Stages int: As per heater IP

    locations nparray:

    slice_type str:

    return
    ------
    None
    """
    assert (
        sum(sum(locations)) == Num_Oscillators * Num_Stages
    ), "Block_Size*Num_Blocks should match the number of inverters!"
    number_of_instances = np.ceil(Num_Oscillators / 32).astype(int)
    RO_locations = dict()
    RO_num = 0
    for i in range(number_of_instances):
        # TODO: Apply the name convention to the TestChip class as well
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
        a = Constraints(
            first_instance_names=f'design_1_i/{instance_name}/'
            'inst/RO[@inst1].nolabel_line95/LUT6_2_inst',
            other_instance_names=f'design_1_i/{instance_name}/inst/RO'
            '[@inst1].notGate[@inst2].Inverter/LUT6_inst',
            max_loop1=Num_Stages, num_stages=instance_num_oscillators*Num_Stages,
            shape=loc_copy, lut_type="ALL", shuffle="NO",
            architecture_path='ZYNQ7000.json'
        )
        a.check_and_propose(locations, slice_type='ALL')
        a.RO_location()
        a = Constraints(
            first_instance_names='',
            other_instance_names=f'design_1_i/{instance_name}/inst/'
            'RO[@inst2].notGate[0].Inverter/out_sig',
            max_loop1=instance_num_oscillators, num_stages=instance_num_oscillators,
            shape=np.array([instance_num_oscillators]), lut_type="ALL", shuffle="NO",
            architecture_path='ZYNQ7000.json'
        )
        a.loops()
    with open('RO_locations.json', 'w') as file:
        json.dump(RO_locations, file)

# TODO: Fix the BTI sensor so that it fits my format here


def BTI_xdc(Num_Oscillators, locations, slice_type='L'):
    """
    Create constraints for the BTI IP for TestChip design.

    parameters
    ----------
    Num_Oscillators int: As per heater IP

    return
    ------
    None
    """
    assert (
        sum(sum(locations)) == Num_Oscillators * 3
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
        a = Constraints(
            first_instance_names=f'design_1_i/{instance_name}/inst/CRO[@inst1].NAND/LUT6_inst',
            other_instance_names=f'design_1_i/{instance_name}/inst/CRO[@inst1].Inverter@inst2',
            max_loop1=3, num_stages=instance_num_oscillators*3,
            shape=loc_copy, lut_type="ALL", shuffle="NO",
            architecture_path='ZYNQ7000.json'
        )
        a.check_and_propose(locations, slice_type='ALL')
        a.RO_location()
        a = Constraints(
            first_instance_names='',
            other_instance_names=f'design_1_i/{instance_name}/inst/CRO[@inst2].Inverter0/in0[0]',
            max_loop1=instance_num_oscillators, num_stages=instance_num_oscillators,
            shape=np.array([instance_num_oscillators]), lut_type="ALL", shuffle="NO",
            architecture_path='ZYNQ7000.json'
        )
        a.loops()
    with open('BTI_locations.json', 'w') as file:
        json.dump(BTI_locations, file)


def chipresources():
    """
    Reads the architecture file and produces an ndarray with the dimentions of the input file.

    parameters
    ----------
    None

    return
    ------
    chipreseources ndarray
    """
    with open('ZYNQ7000.json') as f:
        architecture = json.loads(f.read())
    chipreseources = np.zeros((architecture['MAX'][0]+1, architecture['MAX'][1]+1))
    for item in architecture['N']:
        chipreseources[item[0], item[1]] = -1
    a = np.zeros((architecture['MAX'][1] + 1, architecture['MAX'][0] + 1))
    for i in architecture['L']:
        a[i[1], i[0]] = -1
    for i in architecture['M']:
        a[i[1], i[0]] = -2
    cmap = plt.cm.jet
    cmaplist = ["b", "yellowgreen", "gray"]
    cmap = matplotlib.colors.ListedColormap(cmaplist)
    norm = matplotlib.colors.BoundaryNorm(np.arange(-2.5, 1), cmap.N)
    fig = plt.figure()
    ax = fig.add_subplot(111)
    cax = ax.matshow(a, origin='lower', cmap=cmap, norm=norm)
    cb = fig.colorbar(cax, ticks=[-2, -1, 0])
    cb.ax.set_yticklabels(['SliceM', 'SliceL', 'NA'])
    plt.show()
    return chipreseources
