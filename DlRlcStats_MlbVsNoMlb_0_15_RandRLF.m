
array1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_2/DlRlcStats.txt');
array2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_3/DlRlcStats.txt');

NumEnb = 21;
NumUes = 300;
cellIds = 1:21;


    Thr1   = filterInput(array1, 3, 10); 
    Thr2   = filterInput(array2, 3, 10);

    
    UesPerCellperSecond1 = filterInput_5m(array1, 3, 4); 
    UesPerCellperSecond2 = filterInput_5m(array2, 3, 4); 
   


    AvgUePerCellPerSec1 = AvgUePerCellPerSecond(UesPerCellperSecond1, NumEnb);
    AvgUePerCellPerSec2 = AvgUePerCellPerSecond(UesPerCellperSecond2, NumEnb);

 
UEdata = [AvgUePerCellPerSec1 AvgUePerCellPerSec2 ];

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
f1 = figure('Name', 'Avg Throughput and Avg Num UEs', 'NumberTitle', 'off');           % Figure          
subplot (2, 1, 1);
avg_AvgUePerCellPerSec1 = mean(AvgUePerCellPerSec1);
avg_AvgUePerCellPerSec2 = mean(AvgUePerCellPerSec2);


plot(cellIds, AvgUePerCellPerSec1,'-or')
hold on;
plot(cellIds, AvgUePerCellPerSec2,'-.xb')
hold on;

hold on;
line ([0 9], [avg_AvgUePerCellPerSec1 avg_AvgUePerCellPerSec1], 'linestyle', '-', 'color', 'r');
line ([0 9], [avg_AvgUePerCellPerSec2 avg_AvgUePerCellPerSec2], 'linestyle', '-.', 'color', 'b');

hold on;
set(gca,'XTick',1:1:NumEnb);
set(gca,'YTick',0:10:200);
xlabel('Cell Id')
ylabel('Avg Number of UEs/Cell/Second ')
title ('Using N = 150, Speed = 5 m/sec, Distance 750 m, TxPower = 43.0 dBm  ');
legend ({'No COC', 'COC'}, 'location', 'northeastoutside');
%legend (h2, 'location', 'northeastoutside');
%set (h2, 'fontsize', 12);



%write it a file
plot_data2 = [(Thr1*8/1000) (Thr2*8/1000) ];
plot_data = [cellIds' (Thr1*8/1000) (Thr2*8/1000) ];

subplot (2, 1, 2)

avg_Thr1 = mean(plot_data(:,2));
avg_Thr2 = mean(plot_data(:,3));

avg_Thr =[avg_Thr1 avg_Thr2  ];
%csvwrite('avg_Thr_Modif.csv',avg_Thr);

plot(plot_data(:,1),plot_data(:,2),'-or')
hold on;
plot(plot_data(:,1),plot_data(:,3),'-.xb')
hold on;



line ([0 9], [avg_Thr1 avg_Thr1], 'linestyle', '-', 'color', 'r');
line ([0 9], [avg_Thr2 avg_Thr2], 'linestyle', '-.', 'color', 'b');

hold on;

set(gca,'XTick',1:1:NumEnb);
set(gca,'YTick',0:20:200);
 xlabel('Cell Id')
%set (hx, 'fontsize', 12);
ylabel('Throughput [kbps]')
%title ('Throughput Per Cell using Speed = 0 dB');
legend ({'No COC', 'COC'}, 'location', 'northeastoutside');
%legend (h, 'location', 'northeastoutside');
%set (h, 'fontsize', 12);

saveas(f1,'Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_Thr_and_NumUEs_LinearRLF.png');  % Save plot
savefig('Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_Thr_and_NumUEs_LinearRLF.fig');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f2 = figure('Name', 'Global Average Throughput', 'NumberTitle', 'off');           % Figure  

tmp =[avg_Thr(1) avg_Thr(2) avg_Thr(3) avg_Thr(4)  avg_Thr(5)];
bar(tmp');
hold on;
set (gca, 'xticklabel', {'No COC', 'COC'})

%set(gca,'YTick',0:10:200);
%xlabel('MLB Support ')
ylabel('Global Average Throughput [Kbps]')
title ('Using N = 150, Speed = 5 m/sec, Distance 750 m, TxPower = 43.0 dBm  ');
%set (h2, 'fontsize', 12);
saveas(f2,'Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_GlobalThrRLF.png');  % Save plot
savefig('Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_GlobalThrRLF.fig');

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Three%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


f3 = figure('Name', 'Global Average Number of UEs', 'NumberTitle', 'off');           % Figure  

tmp =[avg_AvgUePerCellPerSec1 avg_AvgUePerCellPerSec2  ];
bar(tmp');
hold on;
set (gca, 'xticklabel', {'No COC', 'COC'})

%set(gca,'YTick',0:10:200);
%xlabel('MLB Support ')
ylabel('Average Number of UEs/Cell/Second')
title ('Using N = 150, Speed = 5 m/sec, Distance 750 m, TxPower = 43.0 dBm  ');
%set (h2, 'fontsize', 12);
saveas(f3,'Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_GlobalNumUEsRLF.png');  % Save plot
savefig('Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_GlobalNumUEsRLF.fig');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Four%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 f4 = figure('Name', 'Average Throughput', 'NumberTitle', 'off');           % Figure  
 
 bar(plot_data2)
 hold on;
 set (gca, 'xticklabel', {1:1:21})
 %set(gca,'YTick',0:0.01:0.14);
 xlabel('Cell Id')
 ylabel('Average Throughput [kbps]')
 legend ({'No COC', 'COC'}, 'location', 'best');
 
 title ('Using N = 150, Speed = 5 m/sec, Distance 750 m, TxPower = 43.0 dBm  ');
 saveas(f4,'Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_Thr_BarsRLF.png');  % Save plot
 savefig('Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_Thr_BarsRLF.fig');
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Five%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
f5 = figure('Name', 'Number of UEs', 'NumberTitle', 'off');           % Figure  
 
 bar(UEdata)
 hold on;
 set (gca, 'xticklabel', {1:1:21})
 %set(gca,'YTick',0:0.01:0.14);
 xlabel('Cell Id')
 ylabel('Average Number of UEs/Cell/Second')
 legend ({'No COC', 'COC'}, 'location', 'best');
 
 title ('Using N = 150, Speed = 5 m/sec, Distance 750 m, TxPower = 43.0 dBm  ');

 saveas(f5,'Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_NumUEs_BarsRLF.png');  % Save plot
  savefig('Plots/DlRlcStats_NoMLB0_6_15_MLB_Rand_NumUEs_BarsRLF.fig');
