function [cpks,clocs] =  clusterpeaks2(x,y)

[pks, locs] = findpeaks(y, x, 'MinPeakDistance', 0.7);
% convert into decimal hours
loc2table = hours(timeofday(locs));
% make and format a dummy axis vector 
table_vec = 1:length(locs)';

table_vec = table_vec';
% make the table with dummy vec and locs 
loc_table = table(table_vec, loc2table);

% detect outliers
outlier_indices = isoutlier(loc_table.loc2table, 'ThresholdFactor', 2.0);
% Get indices 
outlier_row_indices = find(outlier_indices);

% Filter arrays based on clustered outliers 
cpks = pks(~ismember(1:size(locs, 1), outlier_row_indices), :);
clocs = locs(~ismember(1:size(locs, 1), outlier_row_indices), :);
end