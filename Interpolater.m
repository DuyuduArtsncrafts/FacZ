% This was written to take a set ot 1-by-n intensity measurements
% (e.g., narrow ROI intensity scans from microscopy data) and interpolate 
% the data, normalizing them to be 50 units long. This makes it easier to 
% graphically display and statistically compare the data.
%%

%set the path containing your data here
cd 'C:\Users\thoma\OneDrive\Documents\MATLAB\WorkingDocs';

% set the file location
[fileName,folderName] = uigetfile('*.csv');

% read in the file
inputData = readmatrix(fullfile(folderName,fileName));
clear signal;

%% Interpolates data, sets length to 50

%yi = interp1((1:76),inputData(1,1:76),linspace(1,76,50));

% What size is the input matrix? 
% NumCells = number of measured cells, MaxLng = number of measurements in longest cell
NumCells = size(inputData, 1);
MaxLng = size(inputData, 2);

% Create output array, same cell number as input, resized to 50 (arbitrary)
outputData = NaN(NumCells,50);

%% Fill output array with interpolated data
% Loop once for each cell
for CellPos = (1:NumCells);

% how long is the perimeter measurement of this cell (in number of measurements)?
x = (inputData(CellPos,:));
PerimLng = length(x(~isnan(x)));

% create interpolated data of length 50
yi = interp1((1:PerimLng),inputData(CellPos,1:PerimLng),linspace(1,PerimLng,50));

%
outputData(CellPos,:) = yi;

end