classdef BaseAtmosphere < handle
    
    methods (Abstract)
        CalculateDensity(obj, x)
    end
end