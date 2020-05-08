# higher_order_motion_controller
# Objective
The objective of our project to implement higher S-curve motion profiles on a common platform so that we can have on unified device that can cycle through the desired order of movement depending on the aplication needs. There are many choices on the market but they are often very specialized and application specific. Therefore, a user with multiple motion controller needs must work with various different products instead of one common platform. 

# Summary
In order to give control to the user, we implemented  implement a custom interface throught the Xillinx SDK to a microblaze processor that enable the user to input the desired order, direction, and distances. Those values are then sent to the slave registers of our AXI interface that correspond to the appropriate data input of our S curve module. 

# Scurve design 
Our Scurve code is split up into two sections, one block to calculate the frequency output for x and y movement of ste
Currently we have tested the S curve motion profile idenpendantly on both a PYNQ-Z1 and NEXYS4 DDR FPGA board. The sections of code included in this repository will be for calculating the required output frequency, sending the pulse, and communcation between microblaze and the AXI bus 

Independant Scurve motion profile project
Microblaze Setup wtih Scurve for NEXYS
Microblaze Setup with Scurve for PYNQ

again there are timing issues with the current Scurve blocks in tandum with microblaze but removing the blocks to test a simple helloworld program will confirm that microblaze is implimemented correctly. Inside the microblaze folders will also be a workspace folder than contains the code that reads and writes to the assigned registers in the Scurve_axi blocks in the microblaze diagram.


# Members:
Brian Tapia  

ECE: Electrical & Computer Engineering 

Pomona, CA, United States of America 

btapia@cpp.edu 

Bryan J. Banta  

ECE: Electrical & Computer Engineering 

Pomona, CA, United States of America 

bjbanta@cpp.edu 

Hao Luc  

ECE: Electrical & Computer Engineering 

Pomona, CA, United States of America 

hpluc@cpp.edu 

Spencer D. Moore 

ECE: Electrical & Computer Engineering 

Pomona, CA, United States of America 

sdmoore@cpp.edu 

John Alexis S. Villegas  

ECE: Electrical & Computer Engineering 

Pomona, CA, United States of America 

jsvillegas@cpp.edu 

# Advisor
Dr. Mohamed El-Hadedy 

ECE: Electrical & Computer Engineering 

Pomona, CA, United States of America 

mealy@cpp.edu 

For more information the report and presentation for this project will also be attached

# Special thanks
Xilinx
