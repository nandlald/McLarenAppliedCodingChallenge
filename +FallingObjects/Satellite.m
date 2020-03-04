classdef Satellite < FallingObjects.BaseBody
    
    methods         
        function obj = Satellite(m, l, cd)
            sref = l^2;
            obj = obj@FallingObjects.BaseBody(m, sref, cd);
        end        
    end
    
end