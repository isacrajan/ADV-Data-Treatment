fileID = fopen('Stats_Q150_WB.dat', 'w');
formatSpec = 'VARIABLES = \"X\", \"Y\", \"Z\",  \"MeanU\", \"MeanV\", \"MeanW1\", \"MeanW2\", \"RmsU\", \"RmsV\", \"RmsW\", \"TKE\", \"ReStr_UV\",\"ReStr_UW\",\"ReStr_VW\"';
fprintf(fileID, formatSpec);
fprintf(fileID, '\n');
fprintf(fileID, 'ZONE\n');
fprintf(fileID, 'DT=(DOUBLE,DOUBLE,DOUBLE,DOUBLE,DOUBLE,DOUBLE,DOUBLE,DOUBLE,DOUBLE,DOUBLE,DOUBLE,DOUBLE,DOUBLE,DOUBLE)\n');
load('variables_WB_Q150.mat');
fprintf(fileID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f\n', Loc_GenStats_ReStr_Q150_WB');
