classdef (Sealed) FreeFallingDynamics < handle
    
    properties (Access = protected)
        Body
        GravityField
        Atmosphere
        isContact = false
    end
    
    properties (SetAccess = private, GetAccess = public)
        x
        xdot
        tPrevious;
    end
    
    methods
        function obj = FreeFallingDynamics(body, gravityField, atmosphere)
            obj.Body = body;
            obj.GravityField = gravityField;      
            obj.Atmosphere = atmosphere;        
        end
        
        function Initialise(obj, x0, xdot0, t0)
            obj.x = x0;
            obj.xdot = xdot0;
            obj.tPrevious = t0;
        end
        
        function [x, v, a] = Step(obj, t)
            
            if ~obj.isContact
                rho = obj.Atmosphere.CalculateDensity(obj.x);
                Fd = -sign(obj.xdot)*0.5*rho*(obj.xdot^2)*obj.Body.Cd*obj.Body.Sref; % drag
                Fw = obj.GravityField.CalculateWeight(obj.Body.Mass, obj.x); % weight

                xdotdot = (Fw + Fd)/obj.Body.Mass; % acceleration
                obj.x = obj.Integrate(obj.x, obj.xdot, t, obj.tPrevious); % position
                obj.xdot = obj.Integrate(obj.xdot, xdotdot, t, obj.tPrevious); % velocity
            end
            
            if obj.x <= 0 % check for contact with ground
                obj.isContact = true;
            end
            
            if obj.isContact
                x = 0;
                v = 0;
                a = 0;
            else
                obj.tPrevious = t;
                x = obj.x;
                v = obj.xdot;
                a = xdotdot;
            end
        end
        
        function Reset(obj)
            obj.x = 0;
            obj.xdot = 0;
            obj.tPrevious = 0;
            obj.isContact = false;
        end
        
    end
    
    methods (Static, Access = private)
        function x = Integrate(x, xdot, t, tPrevious)
            x = x + xdot*(t - tPrevious);
        end
    end
    
end

