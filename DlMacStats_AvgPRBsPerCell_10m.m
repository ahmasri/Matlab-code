% time	cellId	IMSI	frame	sframe	RNTI	NumPRBs	mcsTb1	sizeTb1	mcsTb2	sizeTb2
clear;
array1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_22p/DlMACStats.csv');
array2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_23p/DlMACStats.csv');
%array3 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_19p/DlRlcStats.csv');
%array4 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_20p/DlRlcStats.csv');
%array5 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_21p/DlRlcStats.csv');

NumEnb = 9;


   sorted1 = sortrows(array1, 2);   % sort the data by cell Id
   sorted2 = sortrows(array2, 2);   % sort the data by cell Id
  
        for i = 1:NumEnb
              tmp1 = sorted1(sorted1(:,2)==i,7); % retrun all PRBs transmitted for  UE = i
              tmp2 = sorted2(sorted2(:,2)==i,7); % retrun all PRBs transmitted for  UE = i
              avgThr1(i) =  mean(tmp1);
              avgThr2(i) =  mean(tmp2);
        end
        
 CellIds = 1:1:9;

 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure One%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f1 = figure('Name', 'PRBs Per Cell', 'NumberTitle', 'off');           % Figure          

plot_data2 = [(avgThr1)' (avgThr2 )' ];

plot_data = [CellIds' (avgThr1)' (avgThr2)' ];
%csvwrite('PRBs Per Cell_10m.csv',plot_data);


avg_Thr1 = mean(plot_data(:,2));
avg_Thr2 = mean(plot_data(:,3));
% avg_Thr3 = mean(plot_data(:,4));
% avg_Thr4 = mean(plot_data(:,5));
% avg_Thr5 = mean(plot_data(:,6));
%avg_Thr6 = mean(plot_data(:,7));
avg_Thr =[avg_Thr1 avg_Thr2 ];%avg_Thr3 avg_Thr4 avg_Thr5 ];
%csvwrite('PRBs Per Cell.csv',avg_Thr);

percentage = ((avg_Thr1-avg_Thr2)/avg_Thr1)*100 

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
  
  
 
