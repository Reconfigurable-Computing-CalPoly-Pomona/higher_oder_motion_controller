# higher_oder_motion_controller
The objective of our project to implement higher S-curve motion profiles on a common platform so that we can have on unified device that can cycle through the desired order of movement depending on the aplication needs. In order to give control to the user, we implemented  implement a custom interface throught the Xillinx SDK to a microblaze processor that enable the user to input the desired order, direction, and distances. Those values are then sent to the slave registers of our AXI interface that correspond to the appropriate data input of our S curve module. 

Currently we have tested the S curve motion profile idenpendantly on both a PYNQ-Z1 and NEXYS4 DDR FPGA board. 
