clear all;


NumEnb = 9;
cellIds = 1:1:NumEnb;
% For Distance 500
 AvgSINR_43_500     = GetAvgSINR ('Run_44');
 AvgSINR_43_500_1   = GetAvgSINR ('Run_44_S2');
 AvgSINR_43_500_2   = GetAvgSINR ('Run_44_S3');
 AvgSINR_43_500_3   = GetAvgSINR ('Run_44_S4');
 
 tmp = [AvgSINR_43_500' AvgSINR_43_500_1' AvgSINR_43_500_2' AvgSINR_43_500_3'];
 tmpmean1_43 = mean(tmp,2,'omitnan');
 
 % For Distance 750
 AvgSINR_43_750     = GetAvgSINR ('Run_45');
 AvgSINR_43_750_1   = GetAvgSINR ('Run_45_S2');
 AvgSINR_43_750_2   = GetAvgSINR ('Run_45_S3');
 AvgSINR_43_750_3   = GetAvgSINR ('Run_45_S4');
 
 tmp = [AvgSINR_43_750' AvgSINR_43_750_1' AvgSINR_43_750_2' AvgSINR_43_750_3'];
 tmpmean2_43 = mean(tmp,2,'omitnan');
 
 % For Distance 1000
 AvgSINR_43_1000     = GetAvgSINR ('Run_46');
 AvgSINR_43_1000_1   = GetAvgSINR ('Run_46_S2');
 AvgSINR_43_1000_2   = GetAvgSINR ('Run_46_S3');
 AvgSINR_43_1000_3   = GetAvgSINR ('Run_46_S4');
 
 tmp = [AvgSINR_43_1000' AvgSINR_43_1000_1' AvgSINR_43_1000_2' AvgSINR_43_1000_3'];
 tmpmean3_43 = mean(tmp,2,'omitnan');
 
 % For Distance 500
 AvgSINR_46_500     = GetAvgSINR ('Run_47');
 AvgSINR_46_500_1   = GetAvgSINR ('Run_47_S2');
 AvgSINR_46_500_2   = GetAvgSINR ('Run_47_S3');
 AvgSINR_46_500_3   = GetAvgSINR ('Run_47_S4');
 
 tmp = [AvgSINR_46_500' AvgSINR_46_500_1' AvgSINR_46_500_2' AvgSINR_46_500_3'];
 tmpmean1_46 = mean(tmp,2,'omitnan');
 
 % For Distance 750
 AvgSINR_46_750     = GetAvgSINR ('Run_48');
 AvgSINR_46_750_1   = GetAvgSINR ('Run_48_S2');
 AvgSINR_46_750_2   = GetAvgSINR ('Run_48_S3');
 AvgSINR_46_750_3   = GetAvgSINR ('Run_48_S4');
 
 tmp = [AvgSINR_46_750' AvgSINR_46_750_1' AvgSINR_46_750_2' AvgSINR_46_750_3'];
 tmpmean2_46 = mean(tmp,2,'omitnan');
 
 % For Distance 1000
 AvgSINR_46_1000     = GetAvgSINR ('Run_49');
 AvgSINR_46_1000_1   = GetAvgSINR ('Run_49_S2');
 AvgSINR_46_1000_2   = GetAvgSINR ('Run_49_S3');
 AvgSINR_46_1000_3   = GetAvgSINR ('Run_49_S4');

 tmp = [AvgSINR_46_1000' AvgSINR_46_1000_1' AvgSINR_46_1000_2' AvgSINR_46_1000_3'];
 tmpmean3_46 = mean(tmp,2,'omitnan');
 
 plot_data = [ tmpmean1_43  tmpmean2_43 tmpmean3_43 tmpmean1_46 tmpmean2_46  tmpmean3_46];
 plot_data_Global = [ mean(tmpmean1_43)  mean(tmpmean2_43) mean(tmpmean3_43) mean(tmpmean1_46) mean(tmpmean2_46)  mean(tmpmean3_46)];
 Percentage1 = (plot_data_Global(4)-plot_data_Global(1))/plot_data_Global(4)*100
 Percentage2 = (plot_data_Global(5)-plot_data_Global(2))/plot_data_Global(5)*100
 Percentage3 = (plot_data_Global(6)-plot_data_Global(3))/plot_data_Global(6)*100
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure One%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 f1 = figure('Name', 'Average SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  


plot(cellIds',plot_data(:,1),':or')
hold on;
plot(cellIds',plot_data(:,2),'--pg')
hold on;
plot(cellIds',plot_data(:,3),'-xc')
hold on;
plot(cellIds',plot_data(:,4),'-sb')
hold on;
plot(cellIds',plot_data(:,5),'-.*m')
hold on;
plot(cellIds',plot_data(:,6),':>k')

hold on;
set(gca,'XTick',1:1:NumEnb);
%set(gca,'YTick',1:5:45);
xlabel('Cell Id')

ylabel('Average SINR [dB]')
title ('Using N = 150 Users, Speed = 0 m/sec');
legend ({'43.0 dBm/500 m', '43.0 dBm/750 m', '43.0 dBm/1000 m', '46.0 dBm/500 m','46.0 dBm/750 m', '46.0 dBm/1000 m'}, 'location', 'best');

saveas(f1,'Plots/DlRsrpSinrStats_AvgSINRvsDistance_500_750_1000_43_46_multirun.png');  % Save plot
savefig('Plots/DlRsrpSinrStats_AvgSINRvsDistance_500_750_1000_43_46_multirun.fig');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 f3 = figure('Name', 'Average SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  
 
 bar(plot_data)
 hold on;
 set (gca, 'xticklabel', {1:1:9})
 %set(gca,'YTick',0:0.01:0.14);
 xlabel('Cell Id')
 ylabel('Average SINR [dB]')
 legend ({'43.0 dBm/500 m', '43.0 dBm/750 m', '43.0 dBm/1000 m', '46.0 dBm/500 m','46.0 dBm/750 m', '46.0 dBm/1000 m'}, 'location', 'best');
 
 title ('Using N = 150 Users, Speed = 0 m/sec  ');

 saveas(f3,'Plots/DlRsrpSinrStats_AvgSINRvsDistance_500_750_1000_43_46_Bars_multirun.png');  % Save plot
 savefig('Plots/DlRsrpSinrStats_AvgSINRvsDistance_500_750_1000_43_46_Bars_multirun.fig');

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 f3 = figure('Name', 'Average SINR/Cell Vs. Distance', 'NumberTitle', 'off');           % Figure  
 
 bar(plot_data_Global)
 hold on;
 set (gca, 'xticklabel', {'43.0/500', '43.0/750', '43.0/1000', '46.0/500','46.0/750', '46.0/1000'})
 %set(gca,'YTick',0:0.01:0.14);
 xlabel('Transmission Power [dBm]/Inter-Site Separation [m]')
 ylabel('Average SINR [dB]')
 %legend ({'43.0/500', '43.0/750', '43.0/1000', '46.0/500','46.0/750', '46.0/1000'}, 'location', 'best');
 
 title ('Using N = 150 Users, Speed = 0 m/sec  ');

 saveas(f3,'Plots/DlRsrpSinrStats_AvgSINRvsDistance_500_750_1000_43_46_Bars_multirunGlobal.png');  % Save plot
 savefig('Plots/DlRsrpSinrStats_AvgSINRvsDistance_500_750_1000_43_46_Bars_multirunGlobal.fig'); 

