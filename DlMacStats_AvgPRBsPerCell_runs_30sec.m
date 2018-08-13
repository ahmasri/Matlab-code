% time	cellId	IMSI	frame	sframe	RNTI	NumPRBs	mcsTb1	sizeTb1	mcsTb2	sizeTb2
clear;
array1 = GetAvgPRB('Run_22p'); 
array2 = GetAvgPRB('Run_22_S2'); 
array3 = GetAvgPRB('Run_22_S3');
array4 = GetAvgPRB('Run_51');

array5 = GetAvgPRB('Run_23p');
array6 = GetAvgPRB('Run_23_S2');
array7 = GetAvgPRB('Run_23_S3');
array8 = GetAvgPRB('Run_50'); 
NumEnb = 9;

        
 CellIds = 1:1:9;
 NoMLBPRB = [array1' array2' array3' array4']
 AvgNoMLBPRB = mean(NoMLBPRB, 2)
 MLBPRB = [ array5' array6' array7' array8'];
 AvgMLBPRB = mean(MLBPRB, 2);
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure One%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f1 = figure('Name', 'PRBs Per Cell', 'NumberTitle', 'off');           % Figure          

plot_data2 = [AvgNoMLBPRB AvgMLBPRB ];

plot_data = [CellIds' AvgNoMLBPRB AvgMLBPRB ];
%csvwrite('PRBs Per Cell_10m.csv',plot_data);


avg_Thr1 = mean(plot_data(:,2));
avg_Thr2 = mean(plot_data(:,3));
% avg_Thr3 = mean(plot_data(:,4));
% avg_Thr4 = mean(plot_data(:,5));
% avg_Thr5 = mean(plot_data(:,6));
%avg_Thr6 = mean(plot_data(:,7));
avg_Thr =[avg_Thr1 avg_Thr2 ];%avg_Thr3 avg_Thr4 avg_Thr5 ];
%csvwrite('PRBs Per Cell.csv',avg_Thr);

plot(plot_data(:,1),plot_data(:,2),'-or')
hold on;
plot(plot_data(:,1),plot_data(:,3),'-.xb')

% plot(plot_data(:,1),plot_data(:,4),'--pg')
% hold on;
% plot(plot_data(:,1), plot_data(:,5),'-*k')
% hold on;
% plot(plot_data(:,1), plot_data(:,6),'--<m')
% hold on;



%line ([0 UEIds], [avg_Thr1 avg_Thr1], 'linestyle', '-', 'color', 'r');
%line ([0 UEIds], [avg_Thr2 avg_Thr2], 'linestyle', '-.', 'color', 'b');
% line ([0 9], [avg_Thr3 avg_Thr3], 'linestyle', '--', 'color', 'g');
% line ([0 9], [avg_Thr4 avg_Thr4], 'linestyle', '-', 'color', 'k');
% line ([0 9], [avg_Thr5 avg_Thr5], 'linestyle', '--', 'color', 'm');
% %line ([0 9], [avg_Thr6 avg_Thr6], 'linestyle', '-', 'color', 'y');
hold on;

set(gca,'XTick',1:1:9);
set(gca,'YTick',20:2:30);
xlabel('Cell Id')

ylabel('Average PRBs Usage Per Cell')

legend ({'NoMLB', 'MLB-Rand'}, 'location', 'northeastoutside');


saveas(f1,'Plots/DlMacStats_AvgPRBsPerCell_10m_linear.png');  % Save plot
savefig('Plots/DlMacStats_AvgPRBsPerCell_10m_linear.fig');
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  
f2 = figure('Name', 'Global average PRBs Usage', 'NumberTitle', 'off');           % Figure  

tmp =[avg_Thr(1) avg_Thr(2)];% avg_Thr(3) avg_Thr(4)  avg_Thr(5)];
bar(tmp');
hold on;
set (gca, 'xticklabel', {'NoMLB', 'MLB-Rand'})
set(gca,'YTick',20:2:30);
%xlabel('MLB Support ')
ylabel('Global Average PRBs Usage')
title ('Using N = 150, Speed = 5 m/sec, Distance 750m, TxPower = 43.0 dBm  ');
%set (h2, 'fontsize', 12);
saveas(f2,'Plots/DlMacStats_GlobalAvgPRBsPerCell_10m_linear.png');  % Save plot
savefig('Plots/DlMacStats_GlobalAvgPRBsPerCell_10m_linear.fig');


   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Three%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
 f3 = figure('Name', 'Average Throughput', 'NumberTitle', 'off');           % Figure  

 bar(plot_data2)
 hold on;
 set (gca, 'xticklabel', {1:1:9})
 xlabel('Cell Ids')
 ylabel('Average PRBs Usage Per Cell')
 legend ({'NoMLB','MLB-Rand'}, 'location', 'best');
 
 title ('Using N = 150, Speed = 5 m/sec, Distance 750m, TxPower = 43.0 dBm  ');

saveas(3,'Plots/DlMacStats_AvgPRBsPerCell_10m_Bars.png');  % Save plot
savefig('Plots/DlMacStats_AvgPRBsPerCell_10m_Basr.fig');
  
  
 
