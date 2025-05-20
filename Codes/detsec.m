function [param] = detsec(param,r1,r2,c1,c2)
sec = param(r1:r2);
cf = mean(param(c1:c2));
sec = detrend(sec);
sec = sec + cf;
param(r1:r2) = sec;
end