classdef ReentryCapsule < FallingObjects.BaseBody
    
    properties (Access = private)
        CdParachuteDeployed % drag coefficient when parachute deployed
        ParachuteDeploymentAltitude % altitude for parachute deployment
    end
    
    methods         
        function obj = ReentryCapsule(m, r, cd, cdParachuteDeployed, xDeploy)
            sref = pi*r^2;
            obj = obj@FallingObjects.BaseBody(m, sref, cd);
            obj.CdParachuteDeployed = cdParachuteDeployed;
            obj.ParachuteDeploymentAltitude = xDeploy;
        end
        
        function UpdateParameters(obj, x, ~, ~)
            if x <= obj.ParachuteDeploymentAltitude
                obj.Cd = obj.CdParachuteDeployed;
            end
        end        
    end
    
end