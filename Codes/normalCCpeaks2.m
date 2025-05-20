% This function handles time series with high peak variability due to noisy
% data. Not meant for circular cases. 

function [stdTOD, mTOD] = normalCCpeaks2(y_vec, t_vec, color, linespec)
    % Find peaks and their locations
    [pks, locs] =clusterpeaks2(t_vec,y_vec);


    loc_hours = timeofday(locs);
    peak_time_hours = hours(loc_hours);
    
    % Calculate mean and standard deviation of peak times in hours
    [meanhour, mew, circ_std_hours] = circmean2(loc_hours);
    mu = mew;
    mTOD = meanhour;
    stdTOD = duration(circ_std_hours, 0, 0, 'Format', 'hh:mm');
    sigma = circ_std_hours;

    % Define the range for the x-axis to cover a full 36 hours
    x = linspace(0, 36, 1000); % 0 to 36 hours

    % Calculate the normal distribution (bell curve)
    y = normpdf(x, mu, sigma);

    % Convert x values back to duration
    x_duration = duration(0, 0, x * 3600); % Convert hours to seconds and then to duration

    % Plot the normal distribution of peak times in duration format
    plot(x_duration, y, 'LineWidth', 2, 'Color', color);
    title('Normal Distribution of Peak Times Over 22 Days');
    xlabel('Time (HH:mm)');
    ylabel('Probability Density');
    xline(mTOD, linespec, 'LineWidth', 2);
    max_hours = 36; % Maximum number of hours

    % Format the axis to show full time scale
    
    labels = cell(1, max_hours + 1);
    for i = 0:max_hours
        labels{i + 1} = datestr(datenum('00:00', 'HH:MM') + i/24, 'HH:MM');
    end
    xticks(duration(0, 0, (0:max_hours) * 3600));
    xticklabels(labels);

end
