%clear all;

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
 Sorted1 = sortrows(array1_43, 2);
 Sorted1_S2 = sortrows(array1_43_S2, 2);
 Sorted1_S3 = sortrows(array1_43_S3, 2);
 
 
 
 Sorted2 = sortrows(array2_44, 2);
 Sorted2_S2 = sortrows(array2_44_S2, 2);
 Sorted2_S3 = sortrows(array2_44_S3, 2);
 
 Sorted3 = sortrows(array3_45, 2);
 Sorted3_S2 = sortrows(array3_45_S2, 2);
 Sorted3_S3 = sortrows(array3_45_S3, 2);
 
 Sorted4 = sortrows(array4_46, 2);
 Sorted4_S2 = sortrows(array4_46_S2, 2);
 Sorted4_S3 = sortrows(array4_46_S3, 2);
 

 

Hist_43 =  zeros(11,9);
Hist_44 =  zeros(11,9);
Hist_45 =  zeros(11,9);
Hist_46 =  zeros(11,9);
 for i = 1:NumEnb
    List1 = Sorted1(Sorted1(:,2) == i, 1:6);
    Hist1 = getCount(List1); % return list (11 x 1)
    
    List1_S2 = Sorted1_S2(Sorted1_S2(:,2) == i, 1:6);
    Hist1_S2 = getCount(List1_S2); % return list (11 x 1)
    
    List1_S3 = Sorted1_S3(Sorted1_S3(:,2) == i, 1:6);
    Hist1_S3 = getCount(List1_S3); % return list (11 x 1)
    

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
    
    
    List2 = Sorted2(Sorted2(:,2) == i, 1:6);
    Hist2 = getCount(List2); % return list (11 x 1)
    
    List2_S2 = Sorted2_S2(Sorted2_S2(:,2) == i, 1:6);
    Hist2_S2 = getCount(List2_S2); % return list (11 x 1)
    
    List2_S3 = Sorted2_S3(Sorted2_S3(:,2) == i, 1:6);
    Hist2_S3 = getCount(List2_S3); % return list (11 x 1)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    List3 = Sorted3(Sorted3(:,2) == i, 1:6);
    Hist3 = getCount(List3); % return list (11 x 1)
    
    List3_S2 = Sorted3_S2(Sorted3_S2(:,2) == i, 1:6);
    Hist3_S2 = getCount(List3_S2); % return list (11 x 1)
    
    List3_S3 = Sorted3_S3(Sorted3_S3(:,2) == i, 1:6);
    Hist3_S3 = getCount(List3_S3); % return list (11 x 1)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    List4 = Sorted4(Sorted4(:,2) == i, 1:6);
    Hist4 = getCount(List4); % return list (11 x 1)
    
    List4_S2 = Sorted4_S2(Sorted4_S2(:,2) == i, 1:6);
    Hist4_S2 = getCount(List4_S2); % return list (11 x 1)
    
    List4_S3 = Sorted4_S3(Sorted4_S3(:,2) == i, 1:6);
    Hist4_S3 = getCount(List4_S3); % return list (11 x 1)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
 total1     = sum(Hist1);
 total1_S2  = sum(Hist1_S2);
 total1_S3  = sum(Hist1_S3);

 X = [total1 total1_S2  total1_S3];
 total1_Avg(i) = mean(X,'omitnan');

 Hist_1_Total   = [Hist1 Hist1_S2 Hist1_S3];
 Hist_1_Avg     = mean(Hist_1_Total,2); % average of each row
 Hist_43(:,i) =  Hist_1_Avg ; 
 
 total2 = sum(Hist2);
 total2_S2 = sum(Hist2_S2);
 total2_S3 = sum(Hist2_S3);
 
 X = [total2 total2_S2 total2_S3];
 total2_Avg(i) = mean(X,'omitnan');

 Hist_2_Total   = [Hist2 Hist2_S2 Hist2_S3];
 Hist_2_Avg     = mean(Hist_2_Total,2);
 Hist_44(:,i) =  Hist_1_Avg ; 
 
 total3     = sum(Hist3);
 total3_S2  = sum(Hist3_S2);
 total3_S3  = sum(Hist3_S3);

 X = [total3 total3_S2  total3_S3];
 total3_Avg(i)  = mean(X,'omitnan');
 
 Hist_3_Total   = [Hist3 Hist3_S2 Hist3_S3];
 Hist_3_Avg     = mean(Hist_3_Total,2);
 Hist_45(:,i) =  Hist_1_Avg ; 
 
 total4     = sum(Hist4);
 total4_S2  = sum(Hist4_S2);
 total4_S3  = sum(Hist4_S3);

 X = [total4 total4_S2 total4_S3];
 total4_Avg(i)     = mean(X,'omitnan');

 Hist_4_Total = [Hist4 Hist4_S2 Hist4_S3];
 Hist_4_Avg = mean(Hist_4_Total,2);
  Hist_46(:,i) =  Hist_1_Avg ; 
 end


% Hist_Avg1 = mean(Hist1,Hist1_S2,Hist1_S3);

    GlobalHist_43 = mean(Hist_43)'; % mean of each row
    GlobalHist_44 = mean(Hist_44)'; % mean of each row
    GlobalHist_45 = mean(Hist_45)'; % mean of each row
    GlobalHist_46 = mean(Hist_46)'; % mean of each row


 TotalHist  = [GlobalHist_43./total1_Avg GlobalHist_44./total2_Avg GlobalHist_45./total3_Avg GlobalHist_46./total4_Avg]
 TotalHist2 = [GlobalHist_43 GlobalHist_44 GlobalHist_45 GlobalHist_46]
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
