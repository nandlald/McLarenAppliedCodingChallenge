classdef DryAir < Atmosphere.BaseAtmosphere
    
    methods        
        function rho = CalculateDensity(obj, x)
            P = 101.325e3*exp(-0.00012*x); % barometric pressure
            T = (15 + 273.15) - x*6.5/1e3; % temperature with lapse rate
            rho = P/(287.058*T);
        end
    end
end