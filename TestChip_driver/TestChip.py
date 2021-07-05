from pynq import Overlay
import numpy as np
from time import sleep

class TestChip(Overlay):
    """TestChip class is the main driver
    class for interacting with our FPGA bitstream
    Coded by: Uncle Arash
    Version: 1.0 : New XADC measurement functionalities added
    Version: 1.1 : New HCI sensor added
    """
    def __init__(self, ol_path, **kwargs):
        super().__init__(ol_path)
        self.heater_base_address = 0x00000000
        self.RO_base_address = 0x00000000
        self.BTI_base_write_address = 0x00000000 #  select read sensor
        self.BTI_base_read_address = 0x00000004 #  select read sensor
        self.HCI_base_freq_address = 0x00000000
        self.HCI_base_duty_address = 0x00000004
        self.HCI_base_write_address = 0x00000008
        self.HCI_base_read_address = 0x0000000C
        self.temp_sensor_address = 0x200
        self.vccint_sensor_address = 0x204
        self.vccaux_sensor_address = 0x208
        self.Vp_Vn_sensor_address = 0x20C
        self.vrefP_sensor_address = 0x210
        self.vrefN_sensor_address = 0x214
        self.vbram_sensor_address = 0x218
        self.pssvccint_sensor_address = 0x234
        self.pssvccaux_sensor_address = 0x238
        self.pssvccmem_sensor_address = 0x23C
        self.counter_address_increament = 0x04
        self.max_intensity = 64
        self.num_oscillators = 31
        self.num_BTI = 31
        self.intensity_dict = {i: int(sum(
                                          [2**j for j in range(i)])
                                      ) for i in range(1, 33)
                               }
        self.intensity_dict[0] = 0
        self.sensor_dict = {i: 2**i for i in range(32)}
        for key, value in kwargs.items():
            if "heater_base_address" in key:
                self.heater_base_address = value
            if "counter_base_address" in key:
                self.counter_base_address = value
            if "num_oscillators" in key:
                self.num_oscillators = value
            if "counter_address_increament" in key:
                self.counter_address_increament = value
            if "temp_sensor_address" in key:
                self.temp_sensor_address = value
        self._a = 4.07548611   # 5
        self._b = 0.50103761   # 50
        self.temp_ctrl_sensitivity = 2
        self.temp_ctrl_intensity = 0

    def XADC_temp(self):
        return ((self.Temp_sensor.read(self.temp_sensor_address
                                       ) >> 4) * 503.975/4096 - 273.15)
  
    def XADC_voltage(self, voltage_name='vccint'):
        if voltage_name == 'vccaux':
            measurement_out = self.Temp_sensor.read(self.vccaux_sensor_address)
        elif voltage_name == 'vbram':
            measurement_out = self.Temp_sensor.read(self.vbram_sensor_address)
        elif voltage_name == 'pssvccint':
            measurement_out = self.Temp_sensor.read(self.pssvccint_sensor_address)
        elif voltage_name == 'pssvccaux':
            measurement_out = self.Temp_sensor.read(self.pssvccaux_sensor_address)
        elif voltage_name == 'pssvccmem':
            measurement_out = self.Temp_sensor.read(self.pssvccmem_sensor_address)
        else:
            measurement_out = self.Temp_sensor.read(self.vccint_sensor_address)
        return (measurement_out >> 4) * 3/4096

    def freq2temp(self, Δf):
        """The values of a and b are for 5 stage ROs in ZYNQ 7000"""
        return Δf * self._a + self._b

    def read_RO(self, RO_dict):
        """Reads the frequency of selected ROs
        Parameters:
        RO_dict : {keys=RO_ip_name, values=[RO list per IP]}

        Returns: freq_dict {keys=RO_ip_name, values=[frequencies (nparray)]}
        """
        freq_dict={}
        for item in RO_dict.keys():
            RO_list = RO_dict[item]
            len_ro = len(RO_list)
            freq_list = np.zeros((len_ro))
            RO = getattr(self, item)
            sleep(0.01)
            for i in range(len_ro):
                freq_list[i] = RO.read(
                    self.RO_base_address +
                    RO_list[i] * self.counter_address_increament
                )/1000
            freq_dict[item] = freq_list
        return freq_dict
    
    def read_BTI(self, BTI_dict):
        """Reads the frequency of selected BTI sensort
        Parameters:
        BTI_dict: {keys=BTI_ip_name, values=[BTI list per IP]}

        Returns: freq_dict {keys=BTI_ip_name, values=[frequencies (nparray)]}
        """
        freq_dict={}
        for item in BTI_dict.keys():
            BTI_list = BTI_dict[item]
            len_ro = len(BTI_list)
            assert len_ro < 31
            freq_list = np.zeros((len_ro))
            BTI = getattr(self, item)
            for i in range(len_ro):
                #   Putting the BTI sensors into the counting mode
                BTI.write(self.BTI_base_write_address, self.sensor_dict[BTI_list[i]])
                sleep(0.01)
                freq_list[i] = BTI.read(
                    self.BTI_base_read_address +
                    BTI_list[i] * self.counter_address_increament
                )/1000
                #print(f'freq: {freq_list[i]}, mem: {self.BTI_base_read_address + BTI_list[i] * self.counter_address_increament}, sensor: {BTI_list[i]}')
                #   Putting the BTI sensors back into the aging mode
                BTI.write(self.BTI_base_write_address, 0)
            freq_dict[item] = freq_list
        return freq_dict

    def HCI_set_pwm(self, HCI_list, input_clock_frequency = 100000000, output_clock_frequency = 100, duty_cycle = 50):
        """Sets the frequency and duty cycle of the HCI sensor
        Parameters:
        HCI_list : [HCI_ip_name]
        
        Returns: None
        """
        for item in HCI_list:
            HCI = getattr(self, item)
            HCI.write(self.HCI_base_freq_address, int(input_clock_frequency / output_clock_frequency))
            sleep(0.01)
            HCI.write(self.HCI_base_duty_address, int((duty_cycle / 100) * input_clock_frequency / output_clock_frequency))
            sleep(0.01)

    def read_HCI(self, HCI_dict):
        """Reads the frequency of selected HCI sensort
        Parameters:
        HCI_dict: {keys=HCI_ip_name, values=[HCI list per IP]}

        Returns: freq_dict {keys=HCI_ip_name, values=[frequencies (nparray)]}
        """
        freq_dict={}
        for item in HCI_dict.keys():
            HCI_list = HCI_dict[item]
            len_ro = len(HCI_list)
            assert len_ro < 29
            freq_list = np.zeros((len_ro))
            HCI = getattr(self, item)
            for i in range(len_ro):
                #   Putting the BTI sensors into the counting mode
                HCI.write(self.HCI_base_write_address, self.sensor_dict[HCI_list[i]])
                sleep(0.01)
                freq_list[i] = HCI.read(
                    self.HCI_base_read_address +
                    HCI_list[i] * self.counter_address_increament
                )/1000
                #   Putting the BTI sensors back into the aging mode
                HCI.write(self.HCI_base_write_address, 0)
            freq_dict[item] = freq_list
        return freq_dict

    def heat_on(self, intensity):
        """Turns the heat on
        top region heat, heats up the whole top region of the chip

        Parameters:
        intensity (int): intensity of the heat
        (the final temperature depends on ventilation
        and/or isolation of the chip)
        intensity has to be between 0 to 64

        Returns: None
        """

        if intensity > self.max_intensity:
            intensity = self.max_intensity
        elif intensity < 0:
            intensity = 0

        if intensity < 33:
            lsb_heater = self.intensity_dict[intensity]
            msb_heater = 0x00000000
        else:
            lsb_heater = 0xFFFFFFFF
            msb_heater = self.intensity_dict[intensity-32]

        self.heater.write(self.heater_base_address, lsb_heater)
        self.heater.write(self.heater_base_address+0x04, msb_heater)

    def heat_off(self):
        """Turns the heat off
        top region heat, heats up the whole top region of the chip

        Returns: None
        """

        self.heater.write(self.heater_base_address, 0x00000000)
        self.heater.write(self.heater_base_address+0x04, 0x00000000)

    def fix_temperature(self, desired_temperature):
        """simple control scheme to fix the temperature to a desired value

        Returns: None
        """

        if self.XADC_temp() > (desired_temperature +
                               self.temp_ctrl_sensitivity):
            self.temp_ctrl_intensity -= 1
            self.heat_on(self.temp_ctrl_intensity)
        elif self.XADC_temp() < (desired_temperature -
                                 self.temp_ctrl_sensitivity):
            self.temp_ctrl_intensity += 1
            self.heat_on(self.temp_ctrl_intensity)
        if self.temp_ctrl_intensity > self.max_intensity:
            self.temp_ctrl_intensity = self.max_intensity
        elif self.temp_ctrl_intensity < 0:
            self.temp_ctrl_intensity = 0

    def __str__(self):
        return (f"Number of ROs: {self.num_oscillators}; "
                "Current temperature: {self.XADC_temp()}; "
                "Number of BTIs: {self.num_BTI}")