# -*- coding: utf-8 -*-
"""
Created on Thu Apr 22 20:41:33 2021

@author: Arash
"""
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import seaborn as sns
from itertools import product as prd
import random
import json
import pandas as pd


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
        max_loop1=1, max_loop2=1, num_stages=3, shape=np.array([[3, 0], [0, 0]]).astype(int),
        lut_type='ALL', start_location=(0, 0), shuffle="NO", architecture_path='ZYNQ7000.json'
    ):
        """
        Parameters
        ----------
        """
        self.first_instance_names = first_instance_names
        self.other_instance_names = other_instance_names
        self.max_loop1 = max_loop1
        self.max_loop2 = max_loop2
        self.num_ROs = num_stages
        self.shape = shape.astype(int)  # num Slices in x * y
        self.lut_type = lut_type  # A, B, C, D, All
        # {generic_name : [num_RO, num_stages, location_tuple]} ; location_tuple = (x1, y1, x2, y2)
        self.start_location = start_location
        self.shuffle = shuffle
        self.data_dict = {'x': [], 'y': [], 'A': [], 'B': [], 'C': [], 'D': []}
        self._outputfile = "constraints"
        with open(architecture_path) as f:
            self._architecture = json.loads(f.read())
        self._max_x = self._architecture['MAX'][0]
        self._max_y = self._architecture['MAX'][1]
        assert self.shape.sum() == num_stages

    def plot_type(self):
        a = np.zeros((self._max_y+1, self._max_x+1))
        for i in self._architecture['L']:
            a[i[1], i[0]] = -1
        for i in self._architecture['M']:
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

    def RO_location(self):
        """
        For location constraints

        Parameters
        ----------
        """
        lut_types = ['A', 'B', 'C', 'D']
        ROs = self.num_ROs
        str1 = 'set_property BEL '
        str2 = '6LUT [get_cells '
        str4 = 'set_property LOC SLICE_'
        list_shape0 = list(range(self.shape.shape[0]))
        list_shape00 = []
        list_shape1 = list(range(self.shape.shape[1]))
        list_shape11 = []
        if "YES" in self.shuffle:
            print("Shufflinh")
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
        with open(self._outputfile + ".XDC", "a") as file:
            for i in list_shape00:
                x = self.start_location[0] + i
                for j in list_shape11:
                    y = self.start_location[1] + j
                    self.data_dict['x'].append(x)
                    self.data_dict['y'].append(y)
                    self.data_dict['A'].append(0)
                    self.data_dict['B'].append(0)
                    self.data_dict['C'].append(0)
                    self.data_dict['D'].append(0)
                    while self.shape[i][j] > 0:
                        self.shape[i][j] -= 1
                        ROs -= 1
                        if len(self.first_instance_names) > 1:
                            if ROs == 0:
                                str3 = self.first_instance_names + ']'
                            else:
                                str3 = '{' + self.other_instance_names.replace(
                                    '@inst1', str((ROs-1) // self.max_loop1)
                                ).replace(
                                    '@inst2', str((ROs-1) % self.max_loop1)
                                ) + '}' + ']'
                        else:
                            str3 = '{' + self.other_instance_names.replace(
                                '@inst1', str(ROs // self.max_loop1)
                            ).replace(
                                '@inst2', str((ROs) % self.max_loop1)
                            ) + '}' + ']'
                        if 'ALL' in self.lut_type.upper():
                            lut_type = lut_types[self.shape[i][j] % 4]
                        else:
                            lut_type = self.lut_type
                        self.data_dict[lut_type][-1] += 1
                        str5 = f'X{x}Y{y} [get_cells '
                        file.write(str1 + lut_type + str2 + str3 + "\n")
                        file.write(str4 + str5 + str3 + "\n")

    def loops(self):
        """
        This function generates contraints to supress combinational loop errors.
        """

        with open(self._outputfile + ".XDC", "a") as file:
            file.write("\n")
            for ROs in range(self.num_ROs):
                file.write(
                    "set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets {" +
                    self.other_instance_names.replace(
                        '@inst1', str(ROs // self.max_loop1)
                    ).replace('@inst2', str(ROs % self.max_loop1)) + '}' + ']' + "\n"
                )

    def plot(self):
        """
        Heatmap plot of the locations.
        """

        key_list = list(self.data_dict.keys())
        for item in key_list:
            if len(self.data_dict[item]) < len(self.data_dict['x']):
                self.data_dict[item] += (len(self.data_dict['x']) - len(self.data_dict[item])) * [0]
        dataframe = pd.DataFrame(self.data_dict)
        dataframe['6LUT'] = dataframe['A'] + dataframe['B'] + dataframe['C'] + dataframe['D']
        for i, j in prd(list(range(self.start_location[0]-5, self.start_location[0]+45)),
                        list(range(self.start_location[1]-5, self.start_location[1]+30))):
            if (i, j) not in list(zip(self.data_dict['x'], self.data_dict['y'])):
                df = pd.DataFrame({'x': [i], 'y': [j], 'A': [0], 'B': [
                                  0], 'C': [0], 'D': [0], '6LUT': [0]})
                dataframe = dataframe.append(df, ignore_index=True)
        dataframe_long = dataframe.pivot_table(index='x', columns='y', values='6LUT')
        f, ax = plt.subplots(figsize=(12, 9))
        sns.heatmap(dataframe_long, annot=False, fmt="d", linewidths=.1, ax=ax)
        return dataframe

    def check_and_propose(self, lut_placement, slice_type='L'):
        """
        checks whether a proposed placement satisfies the slice type condition
        and if it doesn't propose a new placement.

        parameters
        ----------
        lut_placement nparray: desired placement shape

        slice_type str: desired slice type

        return
        ------
        nparray: proposed placement that satisfies the slice condition
        """
        assert lut_placement.shape[0] == self._max_x+1
        assert lut_placement.shape[1] == self._max_y+1
        output = np.copy(lut_placement)
        for i in range(self._max_x+1):
            for j in range(self._max_y+1):
                if lut_placement[i, j] > 0:
                    delta = 1
                    x = i
                    y = j
                    while self(x, y) != slice_type:
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
                                    (self(x, y) == slice_type) and
                                    (output[x, y] == 0)
                                ):
                                    output[x, y] = lut_placement[i, j]
                                    break
                                else:
                                    x = i
                                    y = j
                        delta += 1
        a = np.copy(output)
        a = a.T
        for i in self._architecture['L']:
            if a[i[1], i[0]] == 0:
                a[i[1], i[0]] = -1
        for i in self._architecture['M']:
            if a[i[1], i[0]] == 0:
                a[i[1], i[0]] = -2
        for i in self._architecture['N']:
            #assert a[i[1], i[0]] == 0
            a[i[1], i[0]] = 0
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
