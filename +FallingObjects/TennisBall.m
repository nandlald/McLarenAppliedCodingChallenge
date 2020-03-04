classdef TennisBall < FallingObjects.BaseBody
    
    methods         
        function obj = TennisBall(m, r, cd)
            sref = pi*r^2;
            obj = obj@FallingObjects.BaseBody(m, sref, cd);
        end        
    end
    
end