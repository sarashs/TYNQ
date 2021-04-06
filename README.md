# Simple Ring Oscillator for PYNQ-Z1
## [Most recent updates]
- The AXI peripheral is updated to support upto 4 RO sensors
- Register mapping names are removed and access to measurements are only through register addresses (checkout the Jupyter notebook)
- A python script is added to help with creating constraints on the ring oscillator
## How to use the simple ring Oscillator circuit

Just run the simple_ro.tcl and it should work. If not then just make the project from scratch using the given sources, constraints and the AXI frequency counter IP. The block diagram should look like this:
![alt text](https://github.com/sarashs/ring_oscillator_zynq/blob/main/images/block_design.JPG?raw=true)

You can then modify the above to suit your needs. 

* Note that changing the number of inverters will result in a loop error which you can address by changing the following line of the constraint file:* 
```html
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets {design_1_i/Ring_Oscillator/inst/w[0]}] 
```
where you replace w[0] with the net that is causing the error in your case.

You can follow the pynq documentation on how to get this into your PYNQ board as an overlay. You will need the .hwh and .bit files (provided for this particular design.)

You can then instantiate the design and read the frequency output in a jupyter notebook (on Zynq PS) using the following lines:

```python
from pynq import Overlay
from time import sleep
from matplotlib import pyplot as plt
%matplotlib inline

ol = Overlay('/home/xilinx/pynq/overlays/RO/RO.bit')

data_points = []
for i in range(1000):
    data_points.append(ol.Frequency_counter_AX_0.read(0x04))
    sleep(0.3)
```
The above snipped measures the frequency of the RO 1000 times. Note that 0x04 is the relative (from the base) address of the memory shared between the AXI peripheral and your Arm core. You can then plot your hist and samples using the following code:

```python:
plt.hist(data_points,70)

fig = plt.figure()
plt.plot([i/1000 for i in data_points])
plt.ylabel('MHz')
plt.xlabel('Sample Number')
```

Which will out put the following:

![alt text](https://github.com/sarashs/ring_oscillator_zynq/blob/main/images/hist.JPG?raw=true)

and

![alt text](https://github.com/sarashs/ring_oscillator_zynq/blob/main/images/sample.JPG?raw=true)

Just for shits and giggles, I held an ice cube tp the chip for exactly 20 seconds from 20 to 40 seconds into the experiment (which took exactly 1:51s). The jump in the frequency can definitely be associated with that cooling process.

## Ring Oscillator

One thing that I noticed early on is that different instantiations of the RO circuit varry a lot in their output frequency. I am trying to limit that by restricting how the circuit is synthesized and implemented. I am using LUT6 premitives with pin loc constraints (like in the following image) to force the signal path within an inverter to be exactly the same (as much as possible). 

![alt text](https://github.com/sarashs/ring_oscillator_zynq/blob/main/images/Inverters.JPG?raw=true)

also pblock constraints can be used to limit the spread of the inverters (say to a column).

### Python scripts

There are some python scripts that help with the developmening of experiments etc. They are located in **python_scripts/* folder. In particular there is a script and a few examples for RO constrainst (such that the inverters are placed in the same column or ring oscillators are places on the same slices.)

## Frequency counter

My weird frequency counter can measure from 1.5 KHz all the way to >500 MHz, using ZYNQ's 100 MHz clock. The desing requires that there should be at least 2 ms between each frequency measurement. This is to guarantee measurements for frequencies well bellow 100 MHz and can be decreased if need be. The verilog code is in the /ip-repo folder. Also the best accuracy by design is a few Hz (I don't care to fix it because the ring oscillator frequency varries more than that.)

### Post synthesis simulations

Here are some post synthesis timing simulation snapshots

**10 MHz input:** 
![alt text](https://github.com/sarashs/ring_oscillator_zynq/blob/main/images/10MHz.JPG?raw=true)
**100 MHz input:**
![alt text](https://github.com/sarashs/ring_oscillator_zynq/blob/main/images/100MHz.JPG?raw=true)
**200 MHz input:**
![alt text](https://github.com/sarashs/ring_oscillator_zynq/blob/main/images/200MHz.JPG?raw=true)
**500 MHz input:**
![alt text](https://github.com/sarashs/ring_oscillator_zynq/blob/main/images/500MHz.JPG?raw=true)
**1 GHz input (failure):**
![alt text](https://github.com/sarashs/ring_oscillator_zynq/blob/main/images/1GHzFailure.JPG?raw=true)

## Heater circuit
I employed a heater circuit in line with the basic Self Heating Element (SHE) in the following article (with slight modifications):

```java
A. Amouri, J. Hepp and M. Tahoori, "Built-In Self-Heating Thermal Testing of FPGAs," in IEEE Transactions on Computer-Aided Design of Integrated Circuits and Systems, vol. 35, no. 9, pp. 1546-1556, Sept. 2016, doi: 10.1109/TCAD.2015.2512905.
```
My circuit is controlled through an AXI-Lite IP which can support upto 512 self heating elements. I also use LUT6s with 5 feedback inputs and one control signal. 

### Experimenting with the SHE

I performed a simple test where I places around 10 SHEs around a 5 stage RO:

![alt text](https://github.com/sarashs/ring_oscillator_zynq/blob/main/images/heater_arrangement.JPG?raw=true)

where orange is for ROs and green for SHEs.

Then I ran the following code snippet which turns the heaters on from the 2000th step to the 7000th step:

```python
sensor_4 = []
for i in range(10000):
    if i > 2000 and i < 7000:
        ol.AXI4_heater_0.write(0x00,0x000003FF)
    sensor_4.append(ol.Frequency_counter_AX_0.read(0x0C))
    sleep(0.1)
```
The frequency measurements along with the histogram of the data is depicted in the following figures:

**Fequency measurements:**

![alt text](https://github.com/sarashs/ring_oscillator_zynq/blob/main/images/high_temp.JPG?raw=true)

**Measurement histogram:**

![alt text](https://github.com/sarashs/ring_oscillator_zynq/blob/main/images/high_temp_hist.JPG?raw=true)
