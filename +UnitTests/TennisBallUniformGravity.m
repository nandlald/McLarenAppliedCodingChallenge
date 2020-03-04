classdef TennisBallUniformGravity < matlab.unittest.TestCase
    properties (Access = private)
        BaselineFilename = 'TennisBallUniformGravityBaseline.mat';
    end
    
    methods (Test)
        function RunAndCompare(obj)
            parameters.mass = 0.100;
            parameters.radius = 0.050;
            parameters.Cd = 0.47;
            parameters.g = 9.81;
            parameters.rho = 1.225;
            parameters.mEarth = 5.972e24;
            parameters.rEarth = 6371e3;

            % User selections which would typically come from some other
            % application
            settings.tStart = 0;
            settings.tInc = 1e-3;
            settings.tEnd = 15;
            settings.x0 = 10000;
            settings.v0 = 0;
            settings.gravityField = Selections.GravityFieldType.Uniform;

            output = TennisBallSim(parameters, settings);
            
            baseline = load(fullfile(pwd, '+UnitTests\Baselines', obj.BaselineFilename));
            
            figure;
            subplot(3,1,1)
            plot(output.t, output.x); 
            hold on
            plot(baseline.output.t, baseline.output.x, 'r.'); 
            grid minor
            ylabel('MASL (m)')
            subplot(3,1,2)
            plot(output.t, output.v); 
            hold on
            plot(baseline.output.t, baseline.output.v, 'r.'); 
            grid minor
            ylabel('Velocity (m/s)')
            subplot(3,1,3)
            plot(output.t, output.a); 
            hold on
            plot(baseline.output.t, baseline.output.a, 'r.'); 
            grid minor
            ylabel('Acceleration (m/s^2)')
            xlabel('Time (s)')
            
            
            obj.verifyEqual(output, baseline.output)
        end
    end
end