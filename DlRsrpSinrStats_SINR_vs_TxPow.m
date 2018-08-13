clear all;
array1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_13p/DlRsrpSinrStats.txt');
array2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_26p/DlRsrpSinrStats.txt');
array3 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_27p/DlRsrpSinrStats.txt');
array4 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_16p/DlRsrpSinrStats.txt');
NumEnb = 9;
 cellIds = 1:1:NumEnb;

 %Average SINR per cell
 Sorted1 = sortrows (array1, 2);
 Sorted2 = sortrows (array2, 2);
 Sorted3 = sortrows (array3, 2);
 Sorted4 = sortrows (array4, 2);
 
 Hist1 = zeros (8 , NumEnb);
 Hist2 = zeros (8 , NumEnb);
 Hist3 = zeros (8 , NumEnb);
 Hist4 = zeros (8 , NumEnb);
 
 for i = 1:NumEnb
     
    List1 = Sorted1(Sorted1(:,2) == i, 1:6);
    Hist1(:,i) = getCount(List1); % return list (8 x 1)
    
    List2 = Sorted2(Sorted2(:,2) == i, 1:6);
    Hist2(:,i) = getCount(List2); % return list (8 x 1)
    
    List3 = Sorted3(Sorted3(:,2) == i, 1:6);
    Hist3(:,i) = getCount(List3); % return list (8 x 1)
    
    List4 = Sorted4(Sorted4(:,2) == i, 1:6);
    Hist4(:,i) = getCount(List4); % return list (8 x 1)
 end

 tmp1 = sum(Hist1);
 total1 = sum(tmp1);
 
 tmp2 = sum(Hist2);
 total2 = sum(tmp2);
 
 tmp3 = sum(Hist3);
 total3 = sum(tmp3);
 
 tmp4 = sum(Hist4);
 total4 = sum(tmp4);
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 f1 = figure('Name', 'SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  
 
 bar(Hist1/total1)
 hold on;
 set (gca, 'xticklabel', { '< 0 dB', '0-5 dB', '6-10 dB', '11-15 dB', '16-20 dB', '21-25 dB','26-30 dB', '>30 dB'})
  % Set the axis limits
 axis([0 9 0 0.12])
 %set(gca,'YTick',0:0.01:0.12);
 xlabel('SINR [dB]')
 ylabel('CDF')
 legend ({'Cell 1', 'Cell 2','Cell 3', 'Cell 4','Cell 5', 'Cell 6','Cell 7', 'Cell 8', 'Cell 9'} ,'location', 'best');
 %legend (h, 'location', 'northeastoutside');
 title ('Using N = 150 Users, Speed = 5 m/sec, Distance = 750 m, TxPower = 43.0 dBm');
 %set (h2, 'fontsize', 12);
 saveas(f1,'Plots/DlRsrpSinrStats_SINRVsDist_43dBm_Hist.png');  % Save plot
  savefig('Plots/DlRsrpSinrStats_SINRVsDist_43dBm_Hist.fig');
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 f2 = figure('Name', 'SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  
 
 bar(Hist2/total2)
 hold on;
 set (gca, 'xticklabel', { '< 0 dB', '0-5 dB', '6-10 dB', '11-15 dB', '16-20 dB', '21-25 dB','26-30 dB', '>30 dB'})
  % Set the axis limits
 axis([0 9 0 0.12])
 %set(gca,'YTick',0:0.01:0.12);
 xlabel('SINR [dB]')
 ylabel('CDF')
 h2 = legend ({'Cell 1', 'Cell 2','Cell 3', 'Cell 4','Cell 5', 'Cell 6','Cell 7', 'Cell 8', 'Cell 9'},'location', 'best');
 %legend (h2, 'location', 'northeastoutside');
 title ('Using N = 150 Users, Speed = 5 m/sec , Distance = 750 m, TxPower = 44.0 dBm  ');
 %set (h2, 'fontsize', 12);
 saveas(f2,'Plots/DlRsrpSinrStats_SINRVsDist_44dBm_Hist.png');  % Save plot
 savefig('Plots/DlRsrpSinrStats_SINRVsDist_44dBm_Hist.fig');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Three%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
f3 = figure('Name', 'SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  
 
 bar(Hist3/total3)
 hold on;
 set (gca, 'xticklabel', { '< 0 dB', '0-5 dB', '6-10 dB', '11-15 dB', '16-20 dB', '21-25 dB','26-30 dB', '>30 dB'})
 % Set the axis limits
 axis([0 9 0 0.12])
% set(gca,'YTick',0:0.01:0.12);
 xlabel('SINR [dB]')
 ylabel('CDF')
 legend ({'Cell 1', 'Cell 2','Cell 3', 'Cell 4','Cell 5', 'Cell 6','Cell 7', 'Cell 8', 'Cell 9'},'location', 'best');
 %legend (h3, 'location', 'northeastoutside');
 title ('Using N = 150 Users, Speed = 5 m/sec, Distance = 750 m, TxPower = 45.0 dBm  ');
 %set (h2, 'fontsize', 12);
 saveas(f3,'Plots/DlRsrpSinrStats_SINRVsDist_45dBm_Hist.png');  % Save plot
  savefig('Plots/DlRsrpSinrStats_SINRVsDist_45dBm_Hist.fig');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Four%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 f5 = figure('Name', 'SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  
 
 bar(Hist4/total4)
 hold on;
 set (gca, 'xticklabel', { '< 0 dB', '0-5 dB', '6-10 dB', '11-15 dB', '16-20 dB', '21-25 dB','26-30 dB', '>30 dB'})
 % Set the axis limits
 axis([0 9 0 0.12])
% set(gca,'YTick',0:0.01:0.12);
 xlabel('SINR [dB]')
 ylabel('CDF')
 h3 = legend ({'Cell 1', 'Cell 2','Cell 3', 'Cell 4','Cell 5', 'Cell 6','Cell 7', 'Cell 8', 'Cell 9'},'location', 'best');
 %legend (h3, 'location', 'northeastoutside');
 title ('Using N = 150 Users, Speed = 5 m/sec, Distance = 750 m, TxPower = 46.0 dBm  ');
 %set (h2, 'fontsize', 12);
 saveas(f5,'Plots/DlRsrpSinrStats_SINRVsDist_46dBm_Hist.png');  % Save plot
  savefig('Plots/DlRsrpSinrStats_SINRVsDist_46dBm_Hist.fig');
