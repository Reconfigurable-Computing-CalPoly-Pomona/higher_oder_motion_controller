# higher_order_motion_controller
# Objective
The objective of our project to implement higher S-curve motion profiles on a common platform so that we can have on unified device that can cycle through the desired order of movement depending on the aplication needs. There are many choices on the market but they are often very specialized and application specific. Therefore, a user with multiple motion controller needs must work with various different products instead of one common platform. 

# Introduction to S-curve 
S-curve motion profiling is a way to control the acceleration of a payload in such a way to help smooth the motion and reduce the possibility of exciting a vibration in the system. The purpose of high order scurve profiles is to minimize jerk, the change in acceleration, upon the target payload. This means for delecate operations, acceleration of the payload should be low as possible in order to preserve smoothness on the system. The opposite is true when the target application is needed to read its peak velocity as quick as possible, regardless of vibration on the payload. 

There is a more in-depth look into S-curve on the ReadMe file of the Scurve folder.
<p align="center">
<img src="https://github.com/Reconfigurable-Computing-CalPoly-Pomona/higher_oder_motion_controller/blob/master/images/S_curve_diagram.PNG"> 

# Scurve and Microblaze overview design 
In order to give control to the user, we implemented  implement a custom interface throught the Xillinx SDK to a microblaze processor that enable the user to input the desired order, direction, and distances. Those values are then sent to the slave registers of our AXI interface that correspond to the appropriate data input of our S curve module.

Our Scurve code is split up into two sections, one block to calculate the frequency output for x and y movement of ste
Currently we have tested the S curve motion profile idenpendantly on both a PYNQ-Z1 and NEXYS4 DDR FPGA board. The sections of code included in this repository will be for calculating the required output frequency, sending the pulse, and the communication between the AXI bus and the microblaze processor. 

<p align="center">
<img src="https://github.com/Reconfigurable-Computing-CalPoly-Pomona/higher_oder_motion_controller/blob/master/images/MB_Block_diagram.PNG"> 
  
To implement the common platform we utilize Microblaze allong with the Xillinx SDA in order to sent user input from the terminal into the block. As the project gets improved there can be more and improved user functionality with the Scurve code such as feed back from peripherals and more motion profile selections

<p align="center">
<img src="https://github.com/Reconfigurable-Computing-CalPoly-Pomona/higher_oder_motion_controller/blob/master/images/Motor_Schematic.PNG"> 
  
The schematic to wire the stepper motor driver to the fpga PMOD and the motor to the driver is shown. There is a 100uF capacitor attached to the voltage supply that is supplying 15 volts to the motor. The Vref from the driver is set to about 0.8 Volts to set the maximum current going into the driver. This schematic is shown to power and control an individual motor; therefore, you will need to do this for type of set up for additional motors. The motor was configured in a bipolar series connection. 

# Current issues
There are timing issues with the current Scurve blocks in tandum with microblaze but removing the blocks to test a simple helloworld program will confirm that microblaze is implimemented correctly. Inside the microblaze folders will also be a workspace folder than contains the code that reads and writes to the assigned registers in the Scurve_axi blocks in the microblaze diagram.

# Equipment 
[PYNQ-Z1](https://store.digilentinc.com/pynq-z1-python-productivity-for-zynq-7000-arm-fpga-soc/)  
[NEXYS4 DDR](https://reference.digilentinc.com/reference/programmable-logic/nexys-4-ddr/start)    
[MPU6050 accelerometer](https://invensense.tdk.com/products/motion-tracking/6-axis/mpu-6050/)   
[stepper motor (4209L-01DE-RO)](PartsList/4209L-01DE-RO%20datasheet.pdf)  
[stepper motor driver (A4988)](PartsList/A4988.pdf)  
[Pmod USBUART: USB to UART Interface](PartsList/pmodusbuart_rm.pdf)  
[Tekpower TP3005T Variable Linear DC Power Supply, 0-30V @ 0-5A with Alligator Test Leads ](https://tekpower.us/tp3003t-tp3005t-tp5003tmanual.html )  
Custom hardware platform for motion profile testing  

# Members:
- **Brian Tapia**: Electrical and Computer Engineering department, College of Engineering, California State Polytechnic University, Pomona. btapia@cpp.edu  
- **Bryan J. Banta**: Electrical and Computer Engineering department, College of Engineering, California State Polytechnic University, Pomona. bjbanta@cpp.edu   
- **Hao Luc**: Electrical and Computer Engineering department, College of Engineering, California State Polytechnic University, Pomona. hpluc@cpp.edu   
- **Spencer D. Moore**: Electrical and Computer Engineering department, College of Engineering, California State Polytechnic University, Pomona. sdmoore@cpp.edu  
- **John Alexis S. Villegas**: Electrical and Computer Engineering department, College of Engineering, California State Polytechnic University, Pomona. jsvillegas@cpp.edu   

### Supervising Professor
- **Mohamed El-Hadedy**: Assistant Professor, Electrical and Computer Engineering department, College of Engineering, California State Polytechnic University, Pomona.

### Collaborators

1. **Wen-Mei Hwu**: Director of Center for Cognitive Computing Systems Research and Walter J. Sanders III-AMD Endowed Chair Professor in Elecrical and Computer Engineering at UIUC

2. **Jinjun Xiong**: Director of Center for Cognitive Computing Systems Research and Adjunct Research Professor at UIUC


For more information the report and presentation for this project will also be attached

# Project Sponsors 

1. **[Xilinx Inc.](https://www.xilinx.com/)**

2. **[IBM](https://www.ibm.com)**

3. **[IBM-Illinois Center for Cognitive Computing Systems Research](https://www.c3sr.com/)**
