function [fitresult, gof] = createFit(AirMass, y)
%CREATEFIT(AIRMASS,Y)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : AirMass
%      Y Output: y
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  ������� FIT, CFIT, SFIT.

%  �� MATLAB �� 06-Mar-2019 17:20:09 �Զ�����


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( AirMass, y );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'y vs. AirMass', 'fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel('AirMass');ylabel('ln(V) + ln(d_s^2)');title('Calibration Fitting Curve');
box off;grid on


