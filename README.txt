The simulation of a tennis ball in a user selected gravity field has been written in MATLAB 2017b.

To execute the code you may run the unit tests provided which will execute the sim and compare against a baseline dataset that I've saved as a *.mat file.

In a MATLAB command window execute the following command to run a simulation of a tennis ball free-falling in a uniform gravity field : 
	run(UnitTests.TennisBallUniformGravity)	
	
In a MATLAB command window execute the following command to run a simulation of a tennis ball free-falling in a Newtonian gravity field : 
	run(UnitTests.TennisBallNewtonianGravity)
	
A MATLAB figure will display the altitude above sea level (MASL), velocity and acceleration of the tennis ball once the unit test has concluded. 

I've deliberately left out an application layer that allows the user to vary parameterisation and settings as this should be allowable from any number of environments that the simulation can be embedded in.