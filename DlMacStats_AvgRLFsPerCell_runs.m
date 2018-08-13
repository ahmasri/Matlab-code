% time	cellId	IMSI	frame	sframe	RNTI	NumRLF	mcsTb1	sizeTb1	mcsTb2	sizeTb2
clear;

array1 = GetAvgRLF('Run_2',2);
%array2 = GetAvgRLF('Run_2_S2',1);
% array3 = GetAvgRLF('Run_2_S3', 1);
%array4 = GetAvgRLF('Run_2_S4', 1);

%array5 = GetAvgRLF('Run_3_S2',1);
%array6 = GetAvgRLF('Run_3_S4',1);
array7 = GetAvgRLF('Run_3', 2);

NumEnb = 21;

        
 CellIds = 1:1:NumEnb;
%  NoMLBRlf = [array1' array2'  array4' ];
%  AvgNoMLBRlf = mean(NoMLBRlf, 2)
%  
%  MLBRlf = [  array5' array6' array7' ];
%  AvgMLBRlf = mean(MLBRlf, 2)
%  
%  
%  sum(AvgNoMLBRlf-AvgMLBRlf)
List1 = GetAvgRlfPerSecond('Run_2',2);
List2 = GetAvgRlfPerSecond('Run_3',2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555
 TimeIndex = 1:1:299; 
    tmp1    =   mean(List1(1:200),'omitnan');
    tmp2    =   mean(List1(201:297),'omitnan');
    tmp3    =   mean(List2(1:200),'omitnan');
    tmp4    =   mean(List2(201:297),'omitnan');

f1 = figure('Name', 'Number of RLF Per Second', 'NumberTitle', 'off');           % Figure          


 plot(TimeIndex,List1,'sb')

 hold on;
  plot(TimeIndex,List2,'or')

 hold on;
grid on
set(gca,'XTick',3:10:300);
%set(gca,'YTick',0:10:200);

xlabel('Time [seconds]')
ylabel('Number of RLF Per Second')


hold on;
line ([0 200]   ,    [tmp1 tmp1], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
line ([0 200]   ,    [tmp3 tmp3], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
legend ({'NoCOC', 'COC', 'Global NoCOC', 'Global COC'}, 'location', 'best');
hold on;
line ([201 300] ,    [tmp2 tmp2], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
line ([201 300] ,    [tmp4 tmp4], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
 
saveas(f1,'Plots/DlRlcStats_COC_NOCOC_NumRlfPerSecond_5m.png');  % Save plot
savefig('Plots/DlRlcStats_COC_NOCOC_NumRlfPerSecond_5m.fig');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure One%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 f1 = figure('Name', 'RLF Per Cell', 'NumberTitle', 'off');           % Figure          

%plot_data2 = [AvgNoMLBRlf AvgMLBRlf ];
plot_data2 = [array1' array7' ];
plot_data = [CellIds' array1' array7' ];
%plot_data = [CellIds' AvgNoMLBRlf AvgMLBRlf ];
%csvwrite('RLF Per Cell_10m.csv',plot_data);


avg_Thr1 = mean(plot_data(:,2));
avg_Thr2 = mean(plot_data(:,3));
% avg_Thr3 = mean(plot_data(:,4));
% avg_Thr4 = mean(plot_data(:,5));
% avg_Thr5 = mean(plot_data(:,6));
%avg_Thr6 = mean(plot_data(:,7));
avg_Thr =[avg_Thr1 avg_Thr2 ];%avg_Thr3 avg_Thr4 avg_Thr5 ];
%csvwrite('RLF Per Cell.csv',avg_Thr);

plot(plot_data(:,1),plot_data(:,2),'-ob')
hold on;
plot(plot_data(:,1),plot_data(:,3),'-.xr')

% plot(plot_data(:,1),plot_data(:,4),'--pg')
% hold on;
% plot(plot_data(:,1), plot_data(:,5),'-*k')
% hold on;
% plot(plot_data(:,1), plot_data(:,6),'--<m')
% hold on;



line ([0 NumEnb], [avg_Thr1 avg_Thr1], 'linestyle', '-', 'color', 'b');
line ([0 NumEnb], [avg_Thr2 avg_Thr2], 'linestyle', '-.', 'color', 'r');
% line ([0 9], [avg_Thr3 avg_Thr3], 'linestyle', '--', 'color', 'g');
% line ([0 9], [avg_Thr4 avg_Thr4], 'linestyle', '-', 'color', 'k');
% line ([0 9], [avg_Thr5 avg_Thr5], 'linestyle', '--', 'color', 'm');
% %line ([0 9], [avg_Thr6 avg_Thr6], 'linestyle', '-', 'color', 'y');
hold on;

set(gca,'XTick',1:1:NumEnb);
set(gca,'YTick',20:2:30);
xlabel('Cell Id')

ylabel('Average RLF Per Cell')

legend ({'NoCOC', 'COC'}, 'location', 'northeastoutside');


saveas(f1,'Plots/DlMacStats_AvgRLFPerCell_5m_linear.png');  % Save plot
savefig('Plots/DlMacStats_AvgRLFPerCell_5m_linear.fig');
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  
f2 = figure('Name', 'Global average RLF', 'NumberTitle', 'off');           % Figure  

tmp =[avg_Thr(1) avg_Thr(2)];% avg_Thr(3) avg_Thr(4)  avg_Thr(5)];
bar(tmp');
hold on;
set (gca, 'xticklabel', {'NoCOC', 'COC'})
set(gca,'YTick',20:2:30);
%xlabel('MLB Support ')
ylabel('Global Average RLF ')
title ('Using N = 150, Speed = 5 m/sec, Distance 750m, TxPower = 43.0 dBm  ');
%set (h2, 'fontsize', 12);
saveas(f2,'Plots/DlMacStats_GlobalAvgRLFPerCell_5m_linear.png');  % Save plot
savefig('Plots/DlMacStats_GlobalAvgRLFPerCell_5m_linear.fig');


   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Three%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
 f3 = figure('Name', 'Average Throughput', 'NumberTitle', 'off');           % Figure  

 bar(plot_data2)
 hold on;
 set (gca, 'xticklabel', {1:1:NumEnb})
 xlabel('Cell Ids')
 ylabel('Average RLF  Per Cell')
 legend ({'NoCOC', 'COC'}, 'location', 'best');
 
 title ('Using N = 150, Speed = 5 m/sec, Distance 750m, TxPower = 43.0 dBm  ');

saveas(3,'Plots/DlMacStats_AvgRLFPerCell_5m_Bars.png');  % Save plot
savefig('Plots/DlMacStats_AvgRLFPerCell_5m_Basr.fig');
  
  
 
