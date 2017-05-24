%Gets all the names from specified addres with a specified file extension
allfiles = dir(['C:\Users\tempo\Google Drive\Jason_Isac_2017\Turners_Falls\Raw_ADV_data\152021_212', '\*.vno']);
%Gets all the file names from the structure into a cell array
filenames = {allfiles(~[allfiles.isdir]).name};
fileName = filenames';
%Converts the cell array to a string
filename = char(fileName);
%Gets the size of the string
a = size(filename);

%This loop removes all the names with 3rd character as a underscore
% for i = 1 : a(1)
%     if(fileName{i}(3) == '_')
%         fileName{i} = ' ';
%     end
% end

%removes the part of name after 25th character
for i = 1 : a(1)
    for j = 1 : a(2)
        if( j > 25)
            fileName{i}(j) = ' ';
        end
    end
end

% fileName(~cellfun('isempty',fileName))

%remove the extra whitespaces in the name
fileName = regexprep(fileName, '\s', ''); 

xpos = zeros(size(fileName));
ypos = zeros(size(fileName));
zpos = zeros(size(fileName));

%Filling the X position
for i = 1 : a(1)
    if(fileName{i}(1) == '1')
        xpos(i) = 5.77;
    elseif(fileName{i}(1) == '2')
        xpos(i) = 5.617;
    elseif(fileName{i}(1) == '3')
        xpos(i) = 5.363;
    elseif(fileName{i}(1) == '4')
        xpos(i) = 5.211;
    end
end

%Filling the Y position
for i = 1 : a(1)
    if(fileName{i}(2) == 'A')
        ypos(i) = .315;
    elseif(fileName{i}(2) == 'B')
        ypos(i) = .230;
    elseif(fileName{i}(2) == 'C')
        ypos(i) = .145;
    elseif(fileName{i}(2) == 'D')
        ypos(i) = .060;
    elseif(fileName{i}(2) == 'E')
        ypos(i) = .010;
    end
end

%Filling the Z position
for i = 1 : a(1)
    if(fileName{i}(3) == 'L')
        zpos(i) = 0.03;
    elseif(fileName{i}(3) == 'M')
        zpos(i) = 0.05;
    elseif(fileName{i}(3) == 'H')
        zpos(i) = 0.10;
    end
end

% WRITING TO A EXCEL FILE
XLfile = 'testdata.xlsx'; %name of the excel file
%writing the first rows - the header row
A = {'instrument','filename','nCells', 'nArrays', 'waterDepth','bedElevation','xpos','ypos','zpos','Y','velRange','coordSystem','transMatrix','boundaryDistance','Comment'};
xlswrite(XLfile, A, 1, 'A1'); 
%writing the second rows - the format specifying row
B = {'%s','%s','%d', '%d', '%f','%f','%f','%f','%f','%f','%f','%s','%s','%f','%s'};
xlswrite(XLfile, B, 1, 'A2'); 
%name of the instrument
x = {'Vectrino'};
instr = repmat(x,[a(1) 1]);
xlswrite(XLfile, instr, 1, 'A3');
%writing the file names
xlswrite(XLfile, fileName,1, 'B3'); 
%nCell
x = 1;
ncell = x*ones(a(1),1);
xlswrite(XLfile, ncell, 1, 'C3');
%nArray
x = 1;
narray = x*ones(a(1),1);
xlswrite(XLfile, narray, 1, 'D3');
%waterDepth
x = 1;
wd = x*ones(a(1),1);
xlswrite(XLfile, wd, 1, 'E3');
%bedElevation
x = 1;
be = x*ones(a(1),1);
xlswrite(XLfile, be, 1, 'F3');
%writing the xpos, ypos, zpos
xlswrite(XLfile, xpos,1, 'G3');
xlswrite(XLfile, ypos,1, 'H3');
xlswrite(XLfile, zpos,1, 'I3');
%Y
x = 1;
y = x*ones(a(1),1);
xlswrite(XLfile, y, 1, 'J3');
%velRange
x = 1;
vr = x*ones(a(1),1);
xlswrite(XLfile, vr, 1, 'K3');
%Coordinatesystem
x = {'XYZ'};
instr = repmat(x,[a(1) 1]);
xlswrite(XLfile, instr, 1, 'L3');
%transformation matrix
x = {'[1.9329 0 -1.938 0; 0 1.9507 0 -1.9375; 0.5271 0 0.5078 0; 0 0.4924 0 0.542]'}; %for 333
instr = repmat(x,[a(1) 1]);
xlswrite(XLfile, instr, 1, 'M3');
%boundaryDistance
x = 0.1;
vr = x*ones(a(1),1);
xlswrite(XLfile, vr, 1, 'N3');


