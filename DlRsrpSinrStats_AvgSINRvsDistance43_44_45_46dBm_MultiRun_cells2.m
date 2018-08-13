clear all;

array1_43 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_13p/DlRsrpSinrStats.txt');
array1_43_S2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_13p_S2/DlRsrpSinrStats.txt');
array1_43_S3 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_13p_S3/DlRsrpSinrStats.txt');


array2_44 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_26p/DlRsrpSinrStats.txt');
array2_44_S2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_26p_S2/DlRsrpSinrStats.txt');
array2_44_S3 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_26p_S3/DlRsrpSinrStats.txt');



array3_45 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_27p/DlRsrpSinrStats.txt');
array3_45_S2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_27p_S2/DlRsrpSinrStats.txt');
array3_45_S3 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_27p_S3/DlRsrpSinrStats.txt');


array4_46 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_16p/DlRsrpSinrStats.txt');
array4_46_S2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_16p_S2/DlRsrpSinrStats.txt');
array4_46_S3 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_16p_S3/DlRsrpSinrStats.txt');



 NumEnb = 9;
 cellIds = 1:1:NumEnb;

 %Sort per cell
%  Sorted1 = sortrows(array1_43, 2);
%  Sorted1_S2 = sortrows(array1_43_S2, 2);
%  Sorted1_S3 = sortrows(array1_43_S3, 2);
%  
%  
%  
%  Sorted2 = sortrows(array2_44, 2);
%  Sorted2_S2 = sortrows(array2_44_S2, 2);
%  Sorted2_S3 = sortrows(array2_44_S3, 2);
%  
%  Sorted3 = sortrows(array3_45, 2);
%  Sorted3_S2 = sortrows(array3_45_S2, 2);
%  Sorted3_S3 = sortrows(array3_45_S3, 2);
%  
%  Sorted4 = sortrows(array4_46, 2);
%  Sorted4_S2 = sortrows(array4_46_S2, 2);
%  Sorted4_S3 = sortrows(array4_46_S3, 2);
 
 %Hist1 = zeros(8 , NumEnb);
 %Hist2 = zeros(8 , NumEnb);
 %Hist3 = zeros(8 , NumEnb);
 %Hist4 = zeros(8 , NumEnb);
 
 % we will just look on one cell for different Tx powers


    Hist1 = getCount(array1_43); % return list (11 x 1)
    Hist1_S2 = getCount(array1_43_S2); % return list (11 x 1)
    Hist1_S3 = getCount(array1_43_S3); % return list (11 x 1)

    Hist2 = getCount(array2_44); % return list (11 x 1)
    Hist2_S2 = getCount(array2_44_S2); % return list (11 x 1)
    Hist2_S3 = getCount(array2_44_S3); % return list (11 x 1)
    
    Hist3 = getCount(array3_45); % return list (11 x 1)
    Hist3_S2 = getCount(array3_45_S2); % return list (11 x 1)
    Hist3_S3 = getCount(array3_45_S3); % return list (11 x 1)
    
    Hist4 = getCount(array4_46); % return list (11 x 1)
    Hist4_S2 = getCount(array4_46_S2); % return list (11 x 1)
    Hist4_S3 = getCount(array4_46_S3); % return list (11 x 1)
   

 total1 = sum(Hist1)
 total1_S2 = sum(Hist1_S2);
 total1_S3 = sum(Hist1_S3);

 X = [total1 total1_S2  total1_S3];
 total1_Avg = mean(X,'omitnan');

 Hist_1_Total = [Hist1 Hist1_S2 Hist1_S3];
 Hist_1_Avg = mean(Hist_1_Total,2,'omitnan');
  
 total2 = sum(Hist2);
 total2_S2 = sum(Hist2_S2);
 total2_S3 = sum(Hist2_S3);
 
 X = [total2 total2_S2 total2_S3];
 total2_Avg = mean(X,'omitnan');

 Hist_2_Total = [Hist2 Hist2_S2 Hist2_S3];
 Hist_2_Avg = mean(Hist_2_Total,2,'omitnan');
  
 total3 = sum(Hist3);
 total3_S2 = sum(Hist3_S2);
 total3_S3 = sum(Hist3_S3);

 X = [total3 total3_S2  total3_S3];
 total3_Avg = mean(X,'omitnan');

 Hist_3_Total = [Hist3 Hist3_S2 Hist3_S3];
 Hist_3_Avg = mean(Hist_3_Total,2,'omitnan');
  
 total4 = sum(Hist4);
 total4_S2 = sum(Hist4_S2);
 total4_S3 = sum(Hist4_S3);

 X = [total4 total4_S2 total4_S3];
 total4_Avg = mean(X,'omitnan');

 Hist_4_Total = [Hist4 Hist4_S2 Hist4_S3];
 Hist_4_Avg = mean(Hist_4_Total,2,'omitnan');
 
% Hist_Avg1 = mean(Hist1,Hist1_S2,Hist1_S3);
 

 TotalHist  = [Hist_1_Avg/total1_Avg Hist_2_Avg/total2_Avg Hist_3_Avg/total3_Avg Hist_4_Avg/total4_Avg]
 TotalHist2 = [Hist_1_Avg Hist_2_Avg Hist_3_Avg Hist_4_Avg]
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure One%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 f1 = figure('Name', 'SINR/Cell Vs. TxPower', 'NumberTitle', 'off');           % Figure  
 
 bar(TotalHist)
 hold on;
 
 set (gca, 'xticklabel', { '< 0 dB', '0-5 dB', '6-10 dB', '11-15 dB', '16-20 dB', '21-25 dB','26-30 dB','31-35 dB','36-40 dB','41-45 dB', '>46 dB'})
  % Set the axis limits
 %axis([0 9 0 0.12])
 %set(gca,'YTick',0:0.01:0.12);
 xlabel('SINR [dB]')
 ylabel('CDF')
 legend ({'43.0 dBm', '44.0 dBm','45.0 dBm', '46.0 dBm'} ,'location', 'best');
 %legend (h, 'location', 'northeastoutside');
 title ('Using N = 150 Users, Speed = 5 m/sec, Distance = 750 m, Cell 8');
 %set (h2, 'fontsize', 12);
 saveas(f1,'Plots/DlRsrpSinrStats_AvgSINRvsDistance43_44_45_46dBm_Multirun.png');  % Save plot
 savefig('Plots/DlRsrpSinrStats_AvgSINRvsDistance43_44_45_46dBm_Multirun.fig');

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
 f1 = figure('Name', 'SINR/Cell Vs. TxPower', 'NumberTitle', 'off');           % Figure  
 %Index = 1:1:11;
 semilogy(TotalHist)
 hold on;

 set (gca, 'xticklabel', { '< 0 dB', '0-5 dB', '6-10 dB', '11-15 dB', '16-20 dB', '21-25 dB','26-30 dB','31-35 dB','36-40 dB','41-45 dB', '>46 dB'})
  % Set the axis limits
 %axis([0 9 0 0.12])
 %set(gca,'YTick',0:0.01:0.12);
 xlabel('SINR [dB]')
 ylabel('CDF')
 legend ({'43.0 dBm', '44.0 dBm','45.0 dBm', '46.0 dBm'} ,'location', 'best');
 %legend (h, 'location', 'northeastoutside');
 title ('Using N = 150 Users, Speed = 5 m/sec, Distance = 750 m, Cell 8');
 %set (h2, 'fontsize', 12);
 saveas(f1,'Plots/DlRsrpSinrStats_AvgSINRvsDistance43_44_45_46dBm_linear_Multirun.png');  % Save plot
 savefig('Plots/DlRsrpSinrStats_AvgSINRvsDistance43_44_45_46dBm_linear_Multirun.fig');

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
