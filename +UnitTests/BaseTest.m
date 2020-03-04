classdef BaseTest < matlab.unittest.TestCase
    
    properties (Access = protected)
        BaselineFilename
        Basel
    end
    
    methods
        function obj = BaseTest()
            baseline = load(fullfile(pwd, '+UnitTests\Baselines', obj.BaselineFilename));
        end
    end
    
    methods (Access = protected)
        function PlotComparison(obj, current)            
            baseline = load(fullfile(pwd, '+UnitTests\Baselines', obj.BaselineFilename));
            
            figure;
            subplot(3,1,1)
            plot(current.t, current.x); 
            hold on
            plot(baseline.output.t, baseline.output.x, 'r.'); 
            grid minor
            ylabel('MASL (m)')
            subplot(3,1,2)
            plot(current.t, current.v); 
            hold on
            plot(baseline.output.t, baseline.output.v, 'r.'); 
            grid minor
            ylabel('Velocity (m/s)')
            subplot(3,1,3)
            plot(current.t, current.a); 
            hold on
            plot(baseline.output.t, baseline.output.a, 'r.'); 
            grid minor
            ylabel('Acceleration (m/s^2)')
            xlabel('Time (s)')
        end
    end
end