
clear;
array1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_22p/DlRlcStats.csv');
array2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_23p/DlRlcStats.csv');
%array3 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_19p/DlRlcStats.csv');
%array4 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_20p/DlRlcStats.csv');
%array5 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_21p/DlRlcStats.csv');

NumEnb = 9;
NumUes = 151;
UEIds = 10:10:151;

   sorted1 = sortrows(array1, 4);   % sort the data by UE Id
   sorted2 = sortrows(array2, 4);   % sort the data by UE Id
   j = 1;
        for i = 1:NumUes
            if (mod(i,10) == 0)
              tmp1 = sorted1(sorted1(:,4)==i,10); % retrun all dataRx bytes transmitted for  UE = i
              tmp2 = sorted2(sorted2(:,4)==i,10); % retrun all dataRx bytes transmitted for  UE = i
              avgThr1(j) =  mean(tmp1);
              avgThr2(j) =  mean(tmp2);
              
              j = j+1;
            end
        end
        
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

f1 = figure('Name', 'Throughput Per UE', 'NumberTitle', 'off');           % Figure          
size(avgThr1)
size(avgThr2)
size(UEIds)
plot_data2 = [(avgThr1*8/1000)' (avgThr2 *8/1000)' ];
Percentage = [((avgThr2*8/1000)'-(avgThr1 *8/1000)')./max((avgThr1*8/1000)',(avgThr2 *8/1000)')*100]
plot_data = [UEIds' (avgThr1*8/1000)' (avgThr2*8/1000)' ];
%csvwrite('Thr_vs_cellId_10m.csv',plot_data);


avg_Thr1 = mean(plot_data(:,2));
avg_Thr2 = mean(plot_data(:,3));
% avg_Thr3 = mean(plot_data(:,4));
% avg_Thr4 = mean(plot_data(:,5));
% avg_Thr5 = mean(plot_data(:,6));
%avg_Thr6 = mean(plot_data(:,7));
avg_Thr =[avg_Thr1 avg_Thr2 ];%avg_Thr3 avg_Thr4 avg_Thr5 ];
%csvwrite('avg_Thr_Modif.csv',avg_Thr);

plot(plot_data(:,1),plot_data(:,2),'-or')
hold on;
plot(plot_data(:,1),plot_data(:,3),'-.xb')
hold on;
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

set(gca,'XTick',10:10:NumUes);
set(gca,'YTick',0:10:200);

xlabel('UE Id')
ylabel('Average Throughput Per UE [kbps]')

legend ({'NoMLB', 'MLB-Rand'}, 'location', 'best');

saveas(f1,'Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_ThrPerUE_10m_Linear.png');  % Save plot
savefig('Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_ThrPerUE_10m_Linear.fig');

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f2 = figure('Name', 'Global Average Throughput [kbps] Per UE', 'NumberTitle', 'off');           % Figure  

tmp =[avg_Thr(1) avg_Thr(2)];% avg_Thr(3) avg_Thr(4)  avg_Thr(5)];
bar(tmp');
hold on;
set (gca, 'xticklabel', {'NoMLB', 'MLB-Rand'})

%set(gca,'YTick',0:10:200);
%xlabel('MLB Support ')
ylabel('Global Average Throughput Per UE [kbps]')
title ('Using N = 150, Speed = 5 m/sec, Distance 750m, TxPower = 43.0 dBm  ');
%set (h2, 'fontsize', 12);
saveas(f2,'Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_GlobalThrPerUE_10m.png');  % Save plot
savefig('Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_GlobalThrPerUE_10m.fig');

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Three%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 f3 = figure('Name', 'Average Throughput', 'NumberTitle', 'off');           % Figure  
 
 bar(plot_data2)
 hold on;
 set (gca, 'xticklabel', {10:10:NumUes})
 xlabel('UE Id')
 ylabel('Average Throughput Per UE [kbps]')
 legend ({'NoMLB','MLB-Rand'}, 'location', 'best');
 
 title ('Using N = 150, Speed = 5 m/sec, Distance 750m, TxPower = 43.0 dBm  ');

 saveas(f3,'Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_ThrPerUE_10m_Bars.png');  % Save plot
 savefig('Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_ThrPerUE_10m_Bars.fig');
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Three%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 f3 = figure('Name', 'Average Throughput', 'NumberTitle', 'off');           % Figure  
 
 bar(Percentage)
 hold on;
 set (gca, 'xticklabel', {10:10:NumUes})
 xlabel('UE Id')
 ylabel('Percentage of UE Throughput Improvemnt [100%]')
 legend ({'NoMLB','MLB-Rand'}, 'location', 'best');
 
 title ('Using N = 150, Speed = 5 m/sec, Distance 750m, TxPower = 43.0 dBm  ');

 saveas(f3,'Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_ThrPerUE_10m_Bars_Percent.png');  % Save plot
 savefig('Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_ThrPerUE_10m_Bars_Percent.fig');
  
 
