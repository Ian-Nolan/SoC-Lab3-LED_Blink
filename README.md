Hello! As of 12:30AM on the morning of October 17th, I have suggessfully programmed the board two times. The LEDs have tunred on 0 times, but I am okay with that for now.

Important notes:
1. My systemVerilog testbench did not work for some reason. I have not yet had time to troubleshoot that.
2. in order to program the device there are several quirky steps that are more like loopholes that my friends and I discovered:
   a. the .mmi files located at Lab3\VitisFiles\VitisWorkspace\lab3_app_6\_ide\bitstream and Lab3\VitisFiles\VitisWorkspace\lab3_platform_6\hw\sdt each need to be manually modified to alter the path to the processor by removing the /U0.
   b. building the platform always fails and hangs for me, but building the app also generates and builds the platform so I have been skipping the step of building the platform to avoid it failing and hanging.

Plan for moving forward:
1. Troubleshoot the systemVerilog testbench and test my new module
2. Implement a basic "all LEDs on" design to verify that the board can turn the LEDS on through the FPro system
3. Review all C++ and .h files for enum consistency and more.
4. Try to implement everything together again


