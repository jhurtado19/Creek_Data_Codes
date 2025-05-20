
%% Clean Data Report
% Fill outliers
datareportSep = filloutliers(datareportSep,"linear","gesd","ThresholdFactor",0.25,...
    "DataVariables","TryptophanRFU");

% Fill outliers
datareportSep = filloutliers(datareportSep,"linear","gesd",...
    "DataVariables","CDOMRFU");

% Smooth input data
datareportSep = smoothdata(datareportSep,"gaussian","SmoothingFactor",0.1,...
    "DataVariables","Temperature");

% Smooth input data
datareportSep = smoothdata(datareportSep,"gaussian","SmoothingFactor",0.1,...
    "DataVariables","CDOMRFU");