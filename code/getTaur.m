function tau_r = getTaur(lambda,p,A)
% lamda是波长(nm), p是气压(HPa), A是海拔(km)
lambda = lambda/1000;
tau_r = 0.008569*lambda^(-4)*(1+0.0113*lambda^(-2)+0.00013*lambda^(-4))*(p/1013.25)*exp(-0.125*A);
end