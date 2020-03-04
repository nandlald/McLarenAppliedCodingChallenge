classdef BaseBody < handle
    
    properties (SetAccess = protected, GetAccess = public)
        Mass
        Sref % reference area
        Cd % drag coefficient
    end
    
    methods
        
        function obj = BaseBody(m, sref, cd)
            obj.Mass = m;
            obj.Sref = sref;
            obj.Cd = cd;
        end
        
        function UpdateParameters(obj, x, xdot, t)
        end
        
    end
    
end

