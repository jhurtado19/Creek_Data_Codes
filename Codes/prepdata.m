% Fill outliers
datareport = filloutliers(datareport,"center","movmedian",40,...
    "ThresholdFactor",2.75,"DataVariables","TryptophanRFU");

% Smooth input data
datareport = smoothdata(datareport,"gaussian",56,"DataVariables","TryptophanRFU");

% Fill outliers
datareport = filloutliers(datareport,"center","quartiles","ThresholdFactor",1,...
    "DataVariables","CDOMRFU");

% Smooth input data
datareport = smoothdata(datareport,"movmean","SmoothingFactor",0.25,...
    "DataVariables","CDOMRFU");

%% Smooth input data
%datareport = smoothdata(datareport,"movmean","SmoothingFactor",0.15,...
%    "DataVariables","Temperature");

% Smooth input data
datareport = smoothdata(datareport,"movmean","SmoothingFactor",0.02,...
    "DataVariables","Temperature");
