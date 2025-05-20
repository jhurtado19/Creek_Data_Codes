% Script to make normal distribution of peak times
%'r' or 'red' for red
%'g' or 'green' for green
%'b' or 'blue' for blue
%'c' or 'cyan' for cyan
%'m' or 'magenta' for magenta
%'y' or 'yellow' for yellow
%'k' or 'black' for black
%'w' or 'white' for white

figure;
[wlvlsd,wlmean] = normalcircpeaks(-wlvl,t_usgs,'b','--g');
hold;
[tempsd,tempmean] = normalpeaks2(-temp,t_wql,'r','--g');
[cdomsd,cdommean] = normalcircpeaks(-cdom,t_wql,'c','--g');
[trpsd,trpmean] = normalCCpeaks2(-trp,t_wql,'m','--g');
legend('Water Level', ['wlvl Mean Trough Time: ', datestr(wlmean, 'HH:MM')], ...
           'Temp', ['Temp Mean Trough Time: ', datestr(tempmean, 'HH:MM')], ...
           'CDOM', ['cdom Mean Trough Time: ', datestr(cdommean, 'HH:MM')], ...
           'Tryp', ['Tryp Mean Trough Time: ', datestr(trpmean, 'HH:MM')]);

title("Normal Distribution of Trough Times October")
hold off;

resultsTable = table({'Water Level'; 'Temperature'; 'Tryp'; 'CDOM'}, ...
                     [wlmean; tempmean; trpmean; cdommean], ...
                     [wlvlsd; tempsd; trpsd; cdomsd], ...
                     'VariableNames', {'Parameter', 'MeanTroughTime', 'StandardDeviation'});

% Display the table
disp(resultsTable);