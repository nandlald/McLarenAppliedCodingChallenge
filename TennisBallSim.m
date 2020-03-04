function output = TennisBallSim(parameters, settings)
%TennisBallSim Simulates a free-falling tennis ball
%   Simulation of a free-falling tennis ball in the earth's atmosphere. The
%   user can select between a uniform or Newtonian model of gravititational
%   force.
%   Inputs:
%   - parameters : parameter structure containing the physical quantities
%     required to modify characteristics of the models
%   - settings: settings structure containing the values or selections
%     that allows the user to modify the behaviour of the simulation
%   Outputs:
%   - output : structure containing three arrays, x (position), v
%     (velocity) and a (acceleration) of the tennis ball, and t (time).


object = FallingObjects.TennisBall(parameters.mass, parameters.radius, parameters.Cd);

switch settings.gravityField
    case Selections.GravityFieldType.Uniform
        gField = GravityField.Uniform(parameters.g);
    case Selections.GravityFieldType.Newtonian
        gField = GravityField.Newtonian(parameters.mEarth, parameters.rEarth);
end

atmos = Atmosphere.Uniform(parameters.rho);

sim = FreeFallingDynamics(object, gField, atmos);

[output.x, output.v, output.a, output.t] = RunDynamics(sim, ...
                                             settings.x0, ...
                                             settings.v0, ...
                                             settings.tStart, ...
                                             settings.tInc, ...
                                             settings.tEnd);