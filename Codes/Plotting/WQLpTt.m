

figure;
[wlvlsd,wlmean] = normalCCpeaks(wlvl,t_usgs,'b','--r');
hold;
[trpsd,trpmean] = normalCCpeaks(trp,t_wql,'m','--r');
[cdomsd,cdommean] = normalCCpeaks(cdom,t_wql,'c','--r');
[tempsd,tempmean] = normalpeaks(-temp,t_wql,'r','--g');

legend('Water Level', ['wlvl Mean Peak Time: ', datestr(wlmean, 'HH:MM')], ...
           'Tryp', ['Tryp Mean Peak Time: ', datestr(trpmean, 'HH:MM')], ...
           'CDOM', ['cdom Mean Peak Time: ', datestr(cdommean, 'HH:MM')], ...
           'Temp', ['Temp Mean Trough Time: ', datestr(tempmean, 'HH:MM')]);


title('WQL and Water Lvl Peaks + Temp Trough September')
resultsTable = table({'Water Level'; 'Temperature'; 'Tryp'; 'CDOM'}, ...
                     [wlmean; tempmean; trpmean; cdommean], ...
                     [wlvlsd; tempsd; trpsd; cdomsd], ...
                     'VariableNames', {'Parameter', 'Mean', 'StandardDeviation'});

disp(resultsTable);