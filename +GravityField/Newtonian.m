classdef Newtonian < GravityField.BaseGravity
    
    properties(Access = private)
        M % planet mass
        R % planet radius
    end
    
    methods
        function obj = Newtonian(M, R)
            obj.M = M;
            obj.R = R;
        end
        
        function F = CalculateWeight(obj, m, x)
            F = -6.67408e-11*obj.M*m/(obj.R + x)^2;
        end
    end
end