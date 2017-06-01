%Gets all the names from specified addres with a specified file extension
allfiles = dir(['C:\Users\tempo\Desktop\Raw_ADV_data\151021_333\MITT\MAT files', '\*.mat']);
%Gets all the file names from the structure into a cell array
filenames = {allfiles(~[allfiles.isdir]).name};
fileName = filenames';
a = size(fileName); %to find the number of files in the directory

%Load the location and time matrix
load('C:\Users\tempo\Desktop\Raw_ADV_data\LocationMatrix.mat');
load('C:\Users\tempo\Desktop\Raw_ADV_data\TimeMatrix.mat');

%Create the Velocity Matrix
VelMat100 = zeros(60,3000,4); %flowrate 100
VelMat150 = zeros(60,3000,4); %flowrate 150

for i = 1 : a(1) 
    x = fileName{i}; 
    load(x); %loads each file
    %Takes all the required data from from the loaded file (Data and Config
    %Structure
    U = Data.Despiked.u;
    V = Data.Despiked.v;
    W1 = Data.Despiked.w1;
    W2 = Data.Despiked.w2;
    s = size(U); %size of U,V,W1,W2
    t = Data.timeStamp;
    X = Config.xpos;
    Y = Config.ypos;
    Z = Config.zpos;
    
    %Determine the Location Number using the location matrix
    for j = 1 : 60
        if X == LocationMatrix(j,2) & Y == LocationMatrix(j,3) & Z == LocationMatrix(j,4)
            loc = j;
            break;
        end
    end
    
    %Filling the Velocity Matrix
    if fileName{i}(5) == '0' %For flowrate 100
        VelMat100(loc,1:s(1),1) = U;
        VelMat100(loc,1:s(1),2) = V;
        VelMat100(loc,1:s(1),3) = W1;
        VelMat100(loc,1:s(1),4) = W2;
    elseif fileName{i}(5) == '5' %For flowrate 150
        VelMat150(loc,1:s(1),1) = U;
        VelMat150(loc,1:s(1),2) = V;
        VelMat150(loc,1:s(1),3) = W1;
        VelMat150(loc,1:s(1),4) = W2;
    end
end
%Saving the velocity matrix as .mat file
save('C:\Users\tempo\Desktop\Raw_ADV_data\151021_333\MITT\VelMat100.mat', 'VelMat100');
save('C:\Users\tempo\Desktop\Raw_ADV_data\151021_333\MITT\VelMat150.mat', 'VelMat150');