function [cpks,cloc] =  clusterT(x,y)

[pks, locs] = findpeaks(y, x, 'MinPeakDistance', 0.7);

% convert into decimal hours
loc2table = hours(timeofday(locs));

% make and format a dummy axis vector 
table_vec = 1:length(locs)';

table_vec = table_vec';
% make the table with dummy vec and locs 
loc_table = table(table_vec, loc2table);

% detect outliers
outlier_indices = isoutlier(loc_table.loc2table, 'ThresholdFactor', 3.5);
% Get indices 
outlier_row_indices = find(outlier_indices);

% Filter arrays based on clustered outliers 
clustered_pks = pks(~ismember(1:size(locs, 1), outlier_row_indices), :);

clustered_locs = locs(~ismember(1:size(locs, 1), outlier_row_indices), :);

clustered_pks = -clustered_pks;

 figure;
    plot(x, y);
    hold on;
    plot(clustered_locs, clustered_pks, 'ro');
  %   plot(locs2, pks2, 'ro');
    hold off;

    % Add title
    title(['Clustered Troughs in Data: x = ', inputname(1), ', y = ', inputname(2)]);
end