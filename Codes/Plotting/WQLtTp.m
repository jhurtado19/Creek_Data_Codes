% This script shows WQL troughs and the temp peak

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
[trpsd,trpmean] = normalCCpeaks2(-trp,t_wql,'m','--g');
[cdomsd,cdommean] = normalcircpeaks(-cdom,t_wql,'c','--g');
[tempsd,tempmean] = normalcircpeaks(temp,t_wql,'r','--r');
legend('Water Level', ['wlvl Mean Trough Time: ', datestr(wlmean, 'HH:MM')], ...
           'Tryp', ['Tryp Mean Trough Time: ', datestr(trpmean, 'HH:MM')], ...
           'CDOM', ['cdom Mean Trough Time: ', datestr(cdommean, 'HH:MM')], ...
           'Temp', ['Temp Mean Peak Time: ', datestr(tempmean, 'HH:MM')]);

title('WQL and Water Lvl Troughs + Temp Peak September')

resultsTable = table({'Water Level'; 'Temperature'; 'Tryp'; 'CDOM'}, ...
                     [wlmean; tempmean; trpmean; cdommean], ...
                     [wlvlsd; tempsd; trpsd; cdomsd], ...
                     'VariableNames', {'Parameter', 'Mean', 'StandardDeviation'});

disp(resultsTable);