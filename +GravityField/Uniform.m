classdef Uniform < GravityField.BaseGravity
    
    properties(Access = private)
        g
    end
    
    methods
        function obj = Uniform(g)
            obj.g = g;
        end
            
        function F = CalculateWeight(obj, m, ~)
            F = -m*obj.g;
        end
    end
end