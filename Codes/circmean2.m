
% this function for time vectors with times that are circular beyond
% midnight
function [meanhour, mu, circ_std_hours] = circmean2(x)
    % Convert input to hours
    hrs = hours(x);
    
    % Convert hours to degrees (1 hour = 15 degrees)
    deghrs = hrs * 15;
    
    % Calculate the sum of sine and cosine components
    sinsum = sum(sind(deghrs));
    cossum = sum(cosd(deghrs));
    
    % Calculate the mean angle in degrees
    mean_angle = atand(sinsum/cossum);
    
    % Convert mean angle back to hours
    hrsmean = mean_angle / 15;
    
    % Ensure the mean hour is positive
    
    %if hrsmean < 0
        hrsmean = hrsmean + 24;
    %end
    
    % Assign the mean hour in decimal form to mu
    mu = hrsmean;
    % Format the mean hour for display
    meanhour = duration(mu, 0, 0, 'Format', 'hh:mm');
    
    % Calculate the resultant vector length (R)
    X = sinsum/length(deghrs);
    Y = cossum/length(deghrs);
    R = sqrt(X^2 + Y^2);
    
    % Calculate the circular standard deviation
    circ_std = sqrt(-2 * log(R));
    scaling_factor = 3.12; % Derived from expected standard deviation
    circ_std_hours = circ_std * scaling_factor;
end
