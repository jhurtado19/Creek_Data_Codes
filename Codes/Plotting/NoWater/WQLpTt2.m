

figure;
hold;
[trpsd,trpmean] = normalpeaks(trp,t_wql,'m','--r');
[cdomsd,cdommean] = normalpeaks(cdom,t_wql,'c','--r');
[tempsd,tempmean] = normalpeaks(-temp,t_wql,'r','--g');

legend('Temp', ['Temp Mean Trough Time: ', datestr(tempmean, 'HH:MM')], ...
           'CDOM', ['cdom Mean Peak Time: ', datestr(cdommean, 'HH:MM')], ...
           'Tryp', ['Tryp Mean Peak Time: ', datestr(trpmean, 'HH:MM')]);
title("Normal Distribution of #### August")
hold off;

 resultsTable = table({'Temperature'; 'Tryp'; 'CDOM'}, ...
                         [tempmean; trpmean; cdommean], ...
                         [tempsd; trpsd; cdomsd], ...
                         'VariableNames', {'Parameter', 'MeanPeakTime', 'StandardDeviation'});

disp(resultsTable);