array1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_34p/DlRlcStats.csv');
array2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_35p/DlRlcStats.csv');
array3 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_36p/DlRlcStats.csv');
array4 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_37p/DlRlcStats.csv');
%array5 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_38p/DlRlcStats.csv');
%array6 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_39p/DlRlcStats.csv');

NumEnb = 9;
NumUes = 151;
cellIds = 1:9;


    Thr1   = filterInput(array1, 3, 10); 
    Thr2   = filterInput(array2, 3, 10);
    Thr3   = filterInput(array3, 3, 10); 
    Thr4   = filterInput(array4, 3, 10);
    %Thr5   = filterInput(array5, 3, 10);
    %Thr6   = filterInput(array6, 3, 10);
    
    UesPerCellperSecond1 = filterInput(array1, 3, 4); 
    UesPerCellperSecond2 = filterInput(array2, 3, 4); 
    UesPerCellperSecond3 = filterInput(array3, 3, 4); 
    UesPerCellperSecond4 = filterInput(array4, 3, 4); 
    %UesPerCellperSecond5 = filterInput(array5, 3, 4); 
    %UesPerCellperSecond6 = filterInput(array6, 3, 4);


    AvgUePerCellPerSec1 = AvgUePerCellPerSecond(UesPerCellperSecond1, NumEnb);
    AvgUePerCellPerSec2 = AvgUePerCellPerSecond(UesPerCellperSecond2, NumEnb);
    AvgUePerCellPerSec3 = AvgUePerCellPerSecond(UesPerCellperSecond3, NumEnb);
    AvgUePerCellPerSec4 = AvgUePerCellPerSecond(UesPerCellperSecond4, NumEnb);
    %AvgUePerCellPerSec5 = AvgUePerCellPerSecond(UesPerCellperSecond5, NumEnb);
    %AvgUePerCellPerSec6 = AvgUePerCellPerSecond(UesPerCellperSecond6, NumEnb);
 
UEdata = [AvgUePerCellPerSec1 AvgUePerCellPerSec2 AvgUePerCellPerSec3 AvgUePerCellPerSec4];% AvgUePerCellPerSec5 AvgUePerCellPerSec6];

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
f1 = figure('Name', 'Avg Throughput and Avg Num UEs', 'NumberTitle', 'off');           % Figure          
subplot (2, 1, 1);
avg_AvgUePerCellPerSec1 = mean(AvgUePerCellPerSec1);
avg_AvgUePerCellPerSec2 = mean(AvgUePerCellPerSec2);
avg_AvgUePerCellPerSec3 = mean(AvgUePerCellPerSec3);
avg_AvgUePerCellPerSec4 = mean(AvgUePerCellPerSec4);
%avg_AvgUePerCellPerSec5 = mean(AvgUePerCellPerSec5);
%avg_AvgUePerCellPerSec6 = mean(AvgUePerCellPerSec6);

plot(cellIds, AvgUePerCellPerSec1,'-or')
hold on;
plot(cellIds, AvgUePerCellPerSec2,'-.xb')
hold on;
plot(cellIds, AvgUePerCellPerSec3,'--pg')
hold on;
plot(cellIds, AvgUePerCellPerSec4,'-*k')
hold on;
%plot(cellIds, AvgUePerCellPerSec5,'--<m')
%hold on;
%plot(cellIds, AvgUePerCellPerSec6,':>y')
%hold on;
line ([0 9], [avg_AvgUePerCellPerSec1 avg_AvgUePerCellPerSec1], 'linestyle', '-', 'color', 'r');
line ([0 9], [avg_AvgUePerCellPerSec2 avg_AvgUePerCellPerSec2], 'linestyle', '-.', 'color', 'b');
line ([0 9], [avg_AvgUePerCellPerSec3 avg_AvgUePerCellPerSec3], 'linestyle', '--', 'color', 'g');
line ([0 9], [avg_AvgUePerCellPerSec4 avg_AvgUePerCellPerSec4], 'linestyle', '-', 'color', 'k');
%line ([0 9], [avg_AvgUePerCellPerSec5 avg_AvgUePerCellPerSec5], 'linestyle', '--', 'color', 'm');
%line ([0 9], [avg_AvgUePerCellPerSec6 avg_AvgUePerCellPerSec6], 'linestyle', ':', 'color', 'y');
hold on;
set(gca,'XTick',1:1:NumEnb);
set(gca,'YTick',0:10:200);
xlabel('Cell Id')
ylabel('Avg Number of UEs/Cell/Second ')
title ('Using N = 150, Distance 750 m, TxPower = 43.0 dBm  ');
legend ({'NoMLB 10MHz/NGBR', 'MLB 10MHz/NGBR', 'NoMLB 20MHz/NGBR', 'MLB 20MHz/NGBR'}, 'location', 'best');
%legend (h2, 'location', 'northeastoutside');
%set (h2, 'fontsize', 12);



%write it a file
plot_data2 = [(Thr1*8/1000) (Thr2*8/1000) (Thr3*8/1000) (Thr4*8/1000) ];
plot_data = [cellIds' (Thr1*8/1000) (Thr2*8/1000) (Thr3*8/1000) (Thr4*8/1000) ];
%csvwrite('Thr_vs_cellId_CqaFf_PfFf_Modif.csv',plot_data);
subplot (2, 1, 2)

avg_Thr1 = mean(plot_data(:,2));
avg_Thr2 = mean(plot_data(:,3));
avg_Thr3 = mean(plot_data(:,4));
avg_Thr4 = mean(plot_data(:,5));
% avg_Thr5 = mean(plot_data(:,6));
% avg_Thr6 = mean(plot_data(:,7));
avg_Thr =[avg_Thr1 avg_Thr2 avg_Thr3 avg_Thr4 ];


plot(plot_data(:,1),plot_data(:,2),'-or')
hold on;
plot(plot_data(:,1),plot_data(:,3),'-.xb')
hold on;
plot(plot_data(:,1),plot_data(:,4),'--pg')
hold on;
plot(plot_data(:,1), plot_data(:,5),'-*k')
hold on;
%plot(plot_data(:,1), plot_data(:,6),'--<m')
%hold on;
%plot(plot_data(:,1), plot_data(:,6),':>y')
%hold on;

line ([0 9], [avg_Thr1 avg_Thr1], 'linestyle', '-', 'color', 'r');
line ([0 9], [avg_Thr2 avg_Thr2], 'linestyle', '-.', 'color', 'b');
line ([0 9], [avg_Thr3 avg_Thr3], 'linestyle', '--', 'color', 'g');
line ([0 9], [avg_Thr4 avg_Thr4], 'linestyle', '-', 'color', 'k');
% line ([0 9], [avg_Thr5 avg_Thr5], 'linestyle', '--', 'color', 'm');
% line ([0 9], [avg_Thr6 avg_Thr6], 'linestyle', ':', 'color', 'y');
hold on;

set(gca,'XTick',1:1:NumEnb);
set(gca,'YTick',0:20:200);
 xlabel('Cell Id')
%set (hx, 'fontsize', 12);
ylabel('Throughput [kbps]')
%title ('Throughput Per Cell using Speed = 0 dB');
legend ({'NoMLB 10MHz/NGBR', 'MLB 10MHz/NGBR', 'NoMLB 20MHz/NGBR', 'MLB 20MHz/NGBR'}, 'location', 'best');
%legend (h, 'location', 'northeastoutside');
%set (h, 'fontsize', 12);

saveas(f1,'Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_Thr_and_NumUEs_Linear_Speeds.png');  % Save plot
savefig('Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_Thr_and_NumUEs_Linear_Speeds.fig');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f2 = figure('Name', 'Global Average Throughput', 'NumberTitle', 'off');           % Figure  

tmp =[avg_Thr(1) avg_Thr(2) avg_Thr(3) avg_Thr(4)   ];
bar(tmp');
hold on;
set (gca, 'xticklabel', {'NoMLB 10MHz/NGBR', 'MLB 10MHz/NGBR', 'NoMLB 20MHz/NGBR', 'MLB 20MHz/NGBR'})

%set(gca,'YTick',0:10:200);
%xlabel('MLB Support ')
ylabel('Global Average Throughput [Kbps]')
title ('Using N = 150, Distance 750 m, TxPower = 43.0 dBm  ');
%set (h2, 'fontsize', 12);
saveas(f2,'Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_GlobalThr_Speeds.png');  % Save plot
savefig('Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_GlobalThr_Speeds.fig');

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Three%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


f3 = figure('Name', 'Global Average Number of UEs', 'NumberTitle', 'off');           % Figure  

tmp =[avg_AvgUePerCellPerSec1 avg_AvgUePerCellPerSec2 avg_AvgUePerCellPerSec3 avg_AvgUePerCellPerSec4    ];
bar(tmp');
hold on;
set (gca, 'xticklabel', {'NoMLB 10MHz/NGBR', 'MLB 10MHz/NGBR', 'NoMLB 20MHz/NGBR', 'MLB 20MHz/NGBR'})

%set(gca,'YTick',0:10:200);
%xlabel('MLB Support ')
ylabel('Average Number of UEs/Cell/Second')
title ('Using N = 150, Distance 750 m, TxPower = 43.0 dBm  ');
%set (h2, 'fontsize', 12);
saveas(f3,'Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_GlobalNumUEs_Speeds.png');  % Save plot
savefig('Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_GlobalNumUEs_Speeds.fig');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Four%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 f4 = figure('Name', 'Average Throughput', 'NumberTitle', 'off');           % Figure  
 
 bar(plot_data2)
 hold on;
 set (gca, 'xticklabel', {1:1:9})
 %set(gca,'YTick',0:0.01:0.14);
 xlabel('Cell Id')
 ylabel('Average Throughput [kbps]')
 legend ({'NoMLB 10MHz/NGBR', 'MLB 10MHz/NGBR', 'NoMLB 20MHz/NGBR', 'MLB 20MHz/NGBR'}, 'location', 'best');
 
 title ('Using N = 150,  Distance 750 m, TxPower = 43.0 dBm  ');
 saveas(f4,'Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_Thr_Bars_Speeds.png');  % Save plot
 savefig('Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_Thr_Bars_Speeds.fig');
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Five%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
f5 = figure('Name', 'Number of UEs', 'NumberTitle', 'off');           % Figure  
 
 bar(UEdata)
 hold on;
 set (gca, 'xticklabel', {1:1:9})
 %set(gca,'YTick',0:0.01:0.14);
 xlabel('Cell Id')
 ylabel('Average Number of UEs/Cell/Second')
 legend ({'NoMLB 10MHz/NGBR', 'MLB 10MHz/NGBR', 'NoMLB 20MHz/NGBR', 'MLB 20MHz/NGBR'}, 'location', 'best');
 
 title ('Using N = 150, Distance 750 m, TxPower = 43.0 dBm  ');

 saveas(f5,'Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_NumUEs_Bars_Speeds.png');  % Save plot
  savefig('Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_NumUEs_Bars_Speeds.fig');
