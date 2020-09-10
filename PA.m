%% Read and visualize measured PA INPUT/OUTPUT Data
load('PA_data.mat')
DataRate = 15.36e6;
Tstep = 1/DataRate;

%% Plot PA ip/op measurements
numDataPts = length(inDtataPA);
plot_time((1:numDataPts)*Tstep, abs(inDataPA), abs(outDataPA))

%% Plot PA power transfer function
TransferPA = abs(outDataPA./inDataPA);
plot_power(inDataPA,TransferPA)

%% Determine PA Block Coefficient Matrix From Measured Signals
memLen = 3;
degLen = 3;
halfDataPts = round(numDataPts/2);

%% Plot fitting results
fitCoefMat = powamp_helper('coefficientFinder',inDataPA(1:halfDataPts),outDataPA(1:halfDataPts),memLen,degLen, 'memPoly');

[errSig] = powamp_helper('errorMeasure',inDataPA,outDataPA,fitCoefMat, 'memPoly');
disp(['Signal standard deviation =' num2str(errSig) '%'])

outDataPA_fit = powamp_helper('signalGenerator',inDataPA, fitCoefMat, 'memPoly');

TransferPA_fit = abs(outData_fit./inData(:));
plot_power2(inDAtaPA, TransferPA, TransferPA_fit)

%% Plot Spectrum
h = dsp.SpectrumAnalyzer('SampleRAte', DataRate, 'SpectrumUnits', 'DBW');
step(h, [outDataPA.' outDataPA_fit]);

%%Improve Fitting with Memory Polynomial
memLen = 5;
degLen = 7;
modType = 'ctMemPoly';

%%
fitCoefMat = powamp_helper('coefficientFinder',inDataPA(1:halfDataPts),outDataPA(1:halfDataPts),memLen,degLen,modType);

[errSig] = powamp_helper('errorMeasure',inDataPA(100:end),outDataPA(100:end),fitCoefMat,modType);
disp(['Signal standard deviation =' num2str(errSig)])

outDataPA_fit = simrfV2_powamp_dpd_helper('signalGenerator',inDataPA, fitCoefMat,modType);

TransferPA_fit = abs(outDataPA_fit./inDataPA(:));
plot_power2(inDataPA, TransferPA, TransferPA_fit)

%% Plot Spectrum
h = dsp.SpectrumAnalyzer('SampleRAte', DataRate, 'SpectrumUnits', 'BW');
step(h, [outDataPA.' outDataPA_fit]);