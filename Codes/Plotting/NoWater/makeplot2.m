% Script to make normal distribution of peak times


figure;
hold;
[tempsd,tempmean] = normalpeaks2(temp,t_wql,'r','--r');
[cdomsd,cdommean] = normalCCpeaks(cdom,t_wql,'c','--r');
[trpsd,trpmean] = normalCCpeaks(trp,t_wql,'m','--r');

legend('Temp', ['Temp Mean Peak Time: ', datestr(tempmean, 'HH:MM')], ...
           'CDOM', ['cdom Mean Peak Time: ', datestr(cdommean, 'HH:MM')], ...
           'Tryp', ['Tryp Mean Peak Time: ', datestr(trpmean, 'HH:MM')]);
title("Normal Distribution of Peak Times")
hold off;
grid on;

 resultsTable = table({'Temperature'; 'Tryp'; 'CDOM'}, ...
                         [tempmean; trpmean; cdommean], ...
                         [tempsd; trpsd; cdomsd], ...
                         'VariableNames', {'Parameter', 'MeanPeakTime', 'StandardDeviation'});
% Display the table
disp(resultsTable);
% writetable(resultsTable, 'PeaksJune.csv');