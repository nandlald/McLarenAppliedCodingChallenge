classdef Uniform < Atmosphere.BaseAtmosphere
    
    properties (Access = protected)
        rho % fluid density
    end
    
    methods
        function obj = Uniform(rho)
            obj.rho = rho;
        end
        
        function rho = CalculateDensity(obj, ~)
            rho = obj.rho;
        end
    end
end