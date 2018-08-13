% size too big to do all at the same time
array1_1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_15p/DlRsrpSinrStats.txt');
array2_1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_16p/DlRsrpSinrStats.txt');
array3_1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_17p/DlRsrpSinrStats.txt');

 NumEnb = 9;
 cellIds = 1:1:NumEnb;

 %Average SINR per cell
 Sorted1 = sortrows(array1_1,2);
 Sorted2 = sortrows(array2_1,2);
 Sorted3 = sortrows(array3_1,2);
 
 Hist1 = zeros(8 , NumEnb);
 Hist2 = zeros(8 , NumEnb);
 Hist3 = zeros(8 , NumEnb);
 
 for i = 1:NumEnb        
    List1 = Sorted1(Sorted1(:,2) == i, 1:6);
    Hist1(:,i) = getCount(List1); % return list (8 x 1)
    
    List2 = Sorted2(Sorted2(:,2) == i, 1:6);
    Hist2(:,i) = getCount(List2); % return list (8 x 1)
    
    List3 = Sorted3(Sorted3(:,2) == i, 1:6);
    Hist3(:,i) = getCount(List3); % return list (8 x 1)
    
 end
 
 tmp1 = sum(Hist1);
 total1 = sum(tmp1);
 
 tmp2 = sum(Hist2);
 total2 = sum(tmp2);
 
 tmp3 = sum(Hist3);
 total3 = sum(tmp3);
 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure One%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%  f1 = figure('Name', 'SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  
%  y = [Hist1 Hist2 Hist3 Hist4];
%   bar(y,'stacked')
%  
%  hold on;
% 
%  set (gca, 'xticklabel', { '< 0 dB', '0-5 dB', '6-10 dB', '11-15 dB', '16-20 dB', '21-25 dB','26-30 dB', '>30 dB'})
%  set(gca,'YTick',0:0.01:0.14);
%  xlabel('SINR [dB]')
%  ylabel('CDF')
%  legend ({'Cell 1', 'Cell 2','Cell 3', 'Cell 4','Cell 5', 'Cell 6','Cell 7', 'Cell 8', 'Cell 9'} ,'location', 'best');
%  %legend (h, 'location', 'northeastoutside');
%  title ('Using N = 150 Users, Speed = 5 m/sec, Distance = 500 m, TxPower = 46.0 dBm');
%  %set (h2, 'fontsize', 12);
%  
%  saveas(f1,'Plots/DlRsrpSinrStats_Dist_500_46dBm_Histostacked.png');  % Save plot
%  savefig('Plots/DlRsrpSinrStats_Dist_500_46dBm_Histostacked.fig');

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure One%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 f1 = figure('Name', 'SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  
 
 bar(Hist1/total1)
 hold on;
 set (gca, 'xticklabel', { '< 0 dB', '0-5 dB', '6-10 dB', '11-15 dB', '16-20 dB', '21-25 dB','26-30 dB', '>30 dB'})
 set(gca,'YTick',0:0.01:0.14);
 xlabel('SINR [dB]')
 ylabel('CDF')
 legend ({'Cell 1', 'Cell 2','Cell 3', 'Cell 4','Cell 5', 'Cell 6','Cell 7', 'Cell 8', 'Cell 9'} ,'location', 'best');
 %legend (h, 'location', 'northeastoutside');
 title ('Using N = 150 Users, Speed = 5 m/sec, Distance = 500 m, TxPower = 46.0 dBm');
 %set (h2, 'fontsize', 12);
 
 saveas(f1,'Plots/DlRsrpSinrStats_Dist_500_46dBm_Histo.png');  % Save plot
 savefig('Plots/DlRsrpSinrStats_Dist_500_46dBm_Histo.fig');

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 f2 = figure('Name', 'SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  
 
 bar(Hist2/total2)
 hold on;
 set (gca, 'xticklabel', { '< 0 dB', '0-5 dB', '6-10 dB', '11-15 dB', '16-20 dB', '21-25 dB','26-30 dB', '>30 dB'})
 set(gca,'YTick',0:0.01:0.14);
 xlabel('SINR [dB]')
 ylabel('CDF')
 h2 = legend ({'Cell 1', 'Cell 2','Cell 3', 'Cell 4','Cell 5', 'Cell 6','Cell 7', 'Cell 8', 'Cell 9'},'location', 'best');
 %legend (h2, 'location', 'northeastoutside');
 title ('Using N = 150 Users, Speed = 5 m/sec , Distance = 750 m, TxPower = 46.0 dBm  ');
 %set (h2, 'fontsize', 12);
 saveas(f2,'Plots/DlRsrpSinrStats_Dist_750_46dBm_Histo.png');  % Save plot
 savefig('Plots/DlRsrpSinrStats_Dist_750_46dBm_Histo.fig');
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Three%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 f3 = figure('Name', 'SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  
 
 bar(Hist3/total3)
 hold on;
 set (gca, 'xticklabel', { '< 0 dB', '0-5 dB', '6-10 dB', '11-15 dB', '16-20 dB', '21-25 dB','26-30 dB', '>30 dB'})
 set(gca,'YTick',0:0.01:0.14);
 xlabel('SINR [dB]')
 ylabel('CDF')
 h3 = legend ({'Cell 1', 'Cell 2','Cell 3', 'Cell 4','Cell 5', 'Cell 6','Cell 7', 'Cell 8', 'Cell 9'},'location', 'best');
 %legend (h3, 'location', 'northeastoutside');
 title ('Using N = 150 Users, Speed = 5 m/sec, Distance = 1000 m, TxPower = 46.0 dBm  ');
 %set (h2, 'fontsize', 12);
 saveas(f3,'Plots/DlRsrpSinrStats_Dist_1000_46dBm_Histo.png');  % Save plot
 savefig('Plots/DlRsrpSinrStats_Dist_1000_46dBm_Histo.fig');
