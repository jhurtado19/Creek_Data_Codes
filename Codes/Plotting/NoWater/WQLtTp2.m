figure;
hold;
[trpsd,trpmean] = normalcircpeaks(-trp,t_wql,'m','--g');
[cdomsd,cdommean] = normalcircpeaks(-cdom,t_wql,'c','--g');
[tempsd,tempmean] = normalcircpeaks(temp,t_wql,'r','--r');

legend('Temp', ['Temp Mean Peak Time: ', datestr(tempmean, 'HH:MM')], ...
           'CDOM', ['cdom Mean Peak Time: ', datestr(cdommean, 'HH:MM')], ...
           'Tryp', ['Tryp Mean Peak Time: ', datestr(trpmean, 'HH:MM')]);

title('WQL and Water Lvl Troughs + Temp Peak September')

resultsTable = table({'Temperature'; 'Tryp'; 'CDOM'}, ...
                         [tempmean; trpmean; cdommean], ...
                         [tempsd; trpsd; cdomsd], ...
                         'VariableNames', {'Parameter', 'MeanPeakTime', 'StandardDeviation'});

disp(resultsTable);