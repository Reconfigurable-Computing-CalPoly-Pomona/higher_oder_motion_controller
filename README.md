# higher_order_motion_controller
# Objective
The objective of our project to implement higher S-curve motion profiles on a common platform so that we can have on unified device that can cycle through the desired order of movement depending on the aplication needs. There are many choices on the market but they are often very specialized and application specific. Therefore, a user with multiple motion controller needs must work with various different products instead of one common platform. 

# Summary
In order to give control to the user, we implemented  implement a custom interface throught the Xillinx SDK to a microblaze processor that enable the user to input the desired order, direction, and distances. Those values are then sent to the slave registers of our AXI interface that correspond to the appropriate data input of our S curve module. 

# Scurve and Microblaze overview design 
Our Scurve code is split up into two sections, one block to calculate the frequency output for x and y movement of ste
Currently we have tested the S curve motion profile idenpendantly on both a PYNQ-Z1 and NEXYS4 DDR FPGA board. The sections of code included in this repository will be for calculating the required output frequency, sending the pulse, and the communication between the AXI bus and the microblaze processor. 

To implement the common platform we utilize Microblaze allong with the Xillinx SDA in order to sent user input from the terminal into the block. As the project gets improved there can be more and improved user functionality with the Scurve code such as feed back from peripherals and more motion profile selections

# Code overview

Independant Scurve motion profile project
Microblaze Setup wtih Scurve for NEXYS
Microblaze Setup with Scurve for PYNQ

# Current issues
There are timing issues with the current Scurve blocks in tandum with microblaze but removing the blocks to test a simple helloworld program will confirm that microblaze is implimemented correctly. Inside the microblaze folders will also be a workspace folder than contains the code that reads and writes to the assigned registers in the Scurve_axi blocks in the microblaze diagram.

# Equipment 
[PYNQ-Z1](https://store.digilentinc.com/pynq-z1-python-productivity-for-zynq-7000-arm-fpga-soc/)  
[NEXYS4 DDR](https://reference.digilentinc.com/reference/programmable-logic/nexys-4-ddr/start)    
MPU6050 accelerometer  
[stepper motor (4209L-01DE-RO)](4209L-01DE-RO%20datasheet.pdf)  
stepper motor driver (A4988)  
Pmod USBUART: USB to UART Interface  
Custom hardware platform for motion profile test   

# Members:
Brian Tapia: Electrical and Computer Engineering department, College of Engineering, California State Polytechnic University, Pomona. btapia@cpp.edu  
Bryan J. Banta: Electrical and Computer Engineering department, College of Engineering, California State Polytechnic University, Pomona. bjbanta@cpp.edu   
Hao Luc: Electrical and Computer Engineering department, College of Engineering, California State Polytechnic University, Pomona. hpluc@cpp.edu   
Spencer D. Moore: Electrical and Computer Engineering department, College of Engineering, California State Polytechnic University, Pomona. sdmoore@cpp.edu  
John Alexis S. Villegas: Electrical and Computer Engineering department, College of Engineering, California State Polytechnic University, Pomona. jsvillegas@cpp.edu   

# Advisor
Dr. Mohamed El-Hadedy: Electrical and Computer Engineering department, College of Engineering, California State Polytechnic University, Pomona. mealy@cpp.edu 
### Collaborators

1. **Wen-Mei Hwu**: Director of Center for Cognitive Computing Systems Research and Walter J. Sanders III-AMD Endowed Chair Professor in Elecrical and Computer Engineering at UIUC

2. **Jinjun Xiong**: Director of Center for Cognitive Computing Systems Research and Adjunct Research Professor at UIUC


For more information the report and presentation for this project will also be attached

# Project Sponsors 

1. **[Xilinx Inc.](https://www.xilinx.com/)**

2. **[IBM](https://www.ibm.com)**

3. **[IBM-Illinois Center for Cognitive Computing Systems Research](https://www.c3sr.com/)**
