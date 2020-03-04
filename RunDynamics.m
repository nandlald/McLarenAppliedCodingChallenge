function [x, xdot, xdotdot, t] = RunDynamics(sim, x0, xdot0, tStart, tInc, tEnd)

t = tStart:tInc:tEnd;

sim.Initialise(x0, xdot0, tStart);

nPts = length(t);
x = zeros(nPts,1);
xdot = zeros(nPts,1);
xdotdot = zeros(nPts,1);

for i = 1:nPts
    [x(i), xdot(i), xdotdot(i)] = sim.Step(t(i));
end

sim.Reset();