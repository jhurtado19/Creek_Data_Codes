 figure;
[wlvlsd,wlmean] = normalCCpeaks(wlvl,t_usgs,'b','--r');
hold;
[tempsd,tempmean] = normalcircpeaks(temp,t_wql,'r','--r');
[cdomsd,cdommean] = normalCCpeaks(cdom,t_wql,'c','--r');
[trpsd,trpmean] = normalCCpeaks(trp,t_wql,'m','--r');

legend('Water Level', ['wlvl Mean Trough Time: ', datestr(wlmean, 'HH:MM')], ...
           'Temp', ['Temp Mean Trough Time: ', datestr(tempmean, 'HH:MM')], ...
           'CDOM', ['cdom Mean Trough Time: ', datestr(cdommean, 'HH:MM')], ...
           'Tryp', ['Tryp Mean Trough Time: ', datestr(trpmean, 'HH:MM')]);

title("Normal Distribution of Peak Times October")
hold off;

resultsTable = table({'Water Level'; 'Temperature'; 'Tryp'; 'CDOM'}, ...
                     [wlmean; tempmean; trpmean; cdommean], ...
                     [wlvlsd; tempsd; trpsd; cdomsd], ...
                     'VariableNames', {'Parameter', 'MeanPeakTime', 'StandardDeviation'});

% Display the table
disp(resultsTable);