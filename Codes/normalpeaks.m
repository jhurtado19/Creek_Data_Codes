function [stdTOD,mTOD] = normalpeaks(y_vec, t_vec, color, linespec)
    % Find peaks and their locations
    [pks, locs] = findpeaks(y_vec, t_vec, 'MinPeakDistance', 0.75);
    loc_hours = timeofday(locs);

    % mTOD = mean(loc_hours);
    peak_time_hours = hours(loc_hours);
    stdTOD = std(loc_hours);
    
    % Calculate mean and standard deviation of peak times in hours
    [meanhour, mew, circ_std_hours] = circmean(loc_hours);
    mu = mew;
    mTOD = meanhour;
    sigma = std(peak_time_hours);

    % Define the range for the x-axis to cover a full 24 hours
    x = linspace(0, 24, 1000); % 0 to 24 hours

    % Calculate the normal distribution (bell curve)
    y = normpdf(x, mu, sigma);

    % Convert x values back to duration
    x_duration = duration(0, 0, x * 3600); % Convert hours to seconds and then to duration
    % mean_time_str = datestr(mTOD, 'HH:MM');

    % Plot the normal distribution of peak times in duration format
    plot(x_duration, y, 'LineWidth', 2, 'Color', color);
    title('Normal Distribution of Peak Times Over 22 Days');
    xlabel('Time (HH:mm)');
    ylabel('Probability Density');
    xline(mTOD, linespec, 'LineWidth', 2); % 'Label', 'Mean', 'LabelOrientation', 'horizontal');
    grid on;

    % Return the standard deviation
    return;
end
