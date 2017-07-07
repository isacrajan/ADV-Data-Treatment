% 
% [X,Z] = meshgrid([0.019:0.001:0.171],[0.019:0.001:0.171]);
% name = {'U', 'V', 'W1', 'W2', 'TKE', 'ReStrUV', 'ReStrUW', 'ReStrVW'};
% field = [4,5,6,7,11,12,13,14];
% 
% figure1 = figure;
% 
% annotation(figure1,'textbox',...
%     [0.385119047619048 0.49379932356257 0.25 0.0375263441236606],...
%     'String',{'Downstream direction is towards the right.'},...
%     'Interpreter','latex',...
%     'HorizontalAlignment','center',...
%     'FontSize',14,...
%     'FitBoxToText','off');
% 
% for i = 1 : 8
%     Data=griddata(Loc_GenStat_ReStr_good(:,1), Loc_GenStat_ReStr_good(:,3), Loc_GenStat_ReStr_good(:,field(i)), X,Z,'cubic');
%     subplot(2,4,i);
%     me = mesh(X,Z,Data);
%     hold on;
%     dumfac = max(max(Data));
%     dummy = ones(1,54).*dumfac+1;
%     scatter3(Loc_GenStat_ReStr_good(:,1),Loc_GenStat_ReStr_good(:,3),dummy', '.k');
%     axis tight; 
%     view(0,90); 
%     hold on;
%     colorbar; 
%     title(sprintf('%s', name{i}));
%     %axes([0.019 0.152 0.019 0.1714]);
%     annotation(figure1,'rectangle',...
%     [0.12987012987013 0.580357142857143 0.00285528756957348 0.0431547619047608],...
%     'FaceColor',[0 0 0]);
%     annotation(figure1,'rectangle',...
%     [0.243042671614102 0.580357142857142 0.00285528756957348 0.0431547619047608],...
%     'FaceColor',[0 0 0]);
% end

[X,Z] = meshgrid([0:0.001:0.342],[0.011:0.001:0.171]);
name = {'U', 'V', 'W1', 'W2', 'TKE', 'ReStrUV', 'ReStrUW', 'ReStrVW'};
field = [4,5,6,7,11,12,13,14];

for i = 1 : 8
    figure(i)
    Data=griddata(Loc_GenStats_ReStr(:,1), Loc_GenStats_ReStr(:,3), Loc_GenStats_ReStr(:,field(i)), X,Z,'cubic');
    me = surf(X,Z,Data);
    hold on;
    dumfac = max(max(Data));
    dummy = ones(1,181).*dumfac+1;
    scatter3(Loc_GenStats_ReStr(:,1),Loc_GenStats_ReStr(:,3),dummy', '.k');
    axis tight; 
    view(0,90); 
    hold on;
    colorbar;
    me.EdgeColor = 'none';
    title(sprintf('%s', name{i}));
    annotation(figure(i),'rectangle',...
    [0.155357142857143 0.111904761904762 0.0724285714285713 0.228571428571429]);
    annotation(figure(i),'rectangle',...
    [0.459928571428571 0.111904761904762 0.0668571428571429 0.226190476190477]);
    annotation(figure(i),'rectangle',...
    [0.767071428571428 0.111904761904762 0.0311428571428575 0.226190476190477]);
    annotation(figure(i),'rectangle',...
    [0.788499999999999 0.114285714285715 0.00792857142857206 0.133333333333335],...
    'FaceColor',[0 0 0]);
    annotation(figure(i),'rectangle',...
    [0.486714285714285 0.10952380952381 0.0150714285714287 0.133333333333335],...
    'FaceColor',[0 0 0]);
    annotation(figure(i),'rectangle',...
    [0.181357142857143 0.111904761904762 0.0150714285714286 0.133333333333334],...
    'FaceColor',[0 0 0]);
    saveas(figure(i), sprintf('%s.bmp', name{i}));
    
end