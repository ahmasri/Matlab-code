clear all;

array1_43 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_12p/DlRsrpSinrStats.txt');
array1_46 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_15p/DlRsrpSinrStats.txt');

array2_43 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_13p/DlRsrpSinrStats.txt');
array2_46 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_16p/DlRsrpSinrStats.txt');

array3_43 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_14p/DlRsrpSinrStats.txt');
array3_46 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_17p/DlRsrpSinrStats.txt');


NumEnb = 9;
cellIds = 1:1:NumEnb;
%Average SINR per cell
 Sorted1_43 = sortrows(array1_43,2);
 Sorted1_46 = sortrows(array1_46,2);
 
 Sorted2_43 = sortrows(array2_43,2);
 Sorted2_46 = sortrows(array2_46,2);
 
 Sorted3_43 = sortrows(array3_43,2);
 Sorted3_46 = sortrows(array3_46,2);
 
 for i =1:NumEnb        
   tmpmean1_43(i) =  mean(Sorted1_43(Sorted1_43(:,2) == i, 6));
   tmpmean1_46(i) =  mean(Sorted1_46(Sorted1_46(:,2) == i, 6));
   
   tmpmean2_43(i) =  mean(Sorted2_43(Sorted2_43(:,2) == i, 6));
   tmpmean2_46(i) =  mean(Sorted2_46(Sorted2_46(:,2) == i, 6));
   
   tmpmean3_43(i) =  mean(Sorted3_43(Sorted3_43(:,2) == i, 6));
   tmpmean3_46(i) =  mean(Sorted3_46(Sorted3_46(:,2) == i, 6));
 end


 plot_data = [ tmpmean1_43' tmpmean1_46' tmpmean2_43' tmpmean2_46' tmpmean3_43' tmpmean3_46'];

 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure One%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 f1 = figure('Name', 'Average SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  


plot(cellIds',plot_data(:,1),':or')
hold on;
plot(cellIds',plot_data(:,2),'-sb')
hold on;
plot(cellIds',plot_data(:,3),'--pg')
hold on;
plot(cellIds',plot_data(:,4),'-.*m')
hold on;
plot(cellIds',plot_data(:,5),'-xc')
hold on;
plot(cellIds',plot_data(:,6),':>k')

hold on;
set(gca,'XTick',1:1:NumEnb);
set(gca,'YTick',1:5:45);
 xlabel('Cell Id')

ylabel('Average SINR [dB]')
title ('Using N = 150 Users, Speed = 5 m/sec');
legend ({'43.0 dBm/500 m','46.0 dBm/500 m', '43.0 dBm/750 m', '46.0 dBm/750 m', '43.0 dBm/1000 m', '46.0 dBm/1000 m'}, 'location', 'best');

saveas(f1,'Plots/DlRsrpSinrStats_AvgSINRvsDistance_500_750_1000_43_46.png');  % Save plot
savefig('Plots/DlRsrpSinrStats_AvgSINRvsDistance_500_750_1000_43_46.fig');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 f3 = figure('Name', 'Average SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  
 
 bar(plot_data)
 hold on;
 set (gca, 'xticklabel', {1:1:9})
 %set(gca,'YTick',0:0.01:0.14);
 xlabel('Cell Id')
 ylabel('Average SINR [dB]')
 legend ({'43.0 dBm/500 m','46.0 dBm/500 m', '43.0 dBm/750 m', '46.0 dBm/750 m', '43.0 dBm/1000 m', '46.0 dBm/1000 m'}, 'location', 'best');
 
 title ('Using N = 150 Users, Speed = 5 m/sec  ');

 saveas(f3,'Plots/DlRsrpSinrStats_AvgSINRvsDistance_500_750_1000_43_46_Bars.png');  % Save plot
 savefig('Plots/DlRsrpSinrStats_AvgSINRvsDistance_500_750_1000_43_46_Bars.fig');

  

