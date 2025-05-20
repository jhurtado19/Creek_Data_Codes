function [pks, locs] = plotpeaks(x, y, z)
    % Find peaks
    [pks, locs] = findpeaks(y, x, 'MinPeakDistance', z);
    [pks2, locs2] = findpeaks(-y, x, 'MinPeakDistance', z);
    pks2 = -pks2;

    % Plot data and peaks
    figure;
    plot(x, y);
    hold on;
    plot(locs, pks, 'go');
    plot(locs2, pks2, 'ro');
    hold off;

    % Add title
    title(['Peaks in Data: x = ', inputname(1), ', y = ', inputname(2)]);
end
