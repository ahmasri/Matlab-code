
clear;
array1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_22p/DlRlcStats.csv');
array2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_23p/DlRlcStats.csv');
%array3 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_19p/DlRlcStats.csv');
%array4 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_20p/DlRlcStats.csv');
%array5 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_21p/DlRlcStats.csv');

NumEnb = 9;
NumUes = 150;
UEIds = 1:1:150;

   sorted1 = sortrows(array1, 4);   % sort the data by cell Id
   sorted2 = sortrows(array2, 4);   % sort the data by cell Id
   j = 1;
        for i = 1:NumUes
            
              tmp1 = sorted1(sorted1(:,4)==i,10); % retrun all dataRx bytes transmitted for  UE = i
              tmp2 = sorted2(sorted2(:,4)==i,10); % retrun all dataRx bytes transmitted for  UE = i
              Thr1(i) =  mean(tmp1);
              Thr2(i) =  mean(tmp2);
          
         end
        


plot_data = [UEIds' (Thr1*8/1000)' (Thr2*8/1000)' ];

% to compute the percentage of improvement 
avg_Thr1 = mean(plot_data(:,2), 'omitnan');
avg_Thr2 = mean(plot_data(:,3),'omitnan');

((avg_Thr2-avg_Thr1)/max(avg_Thr1,avg_Thr2))*100

% Anotherway: to compute the percentage of improvement 


tmp1 = ((Thr2*8)/1000)';
tmp2 = ((Thr1 *8)/1000)';
tmp3 = tmp1-tmp2;
tmp4 = (tmp3)./max(tmp1,tmp2);
Percentage = tmp4*100;
Improved = 0;
NotImproved = 0;
for i  = 1:NumUes
    if Percentage(i) > 0
       Improved = Improved +1;
    else
       NotImproved = NotImproved +1; % or 1-Improved
    end
end
fprintf('Percentage of Improved UEs: %.2f \n',(Improved/NumUes)*100);
fprintf('Percentage of Not Improved UEs: %.2f \n',(NotImproved/NumUes)*100);

avg_Thr =[avg_Thr1 avg_Thr2 ];%avg_Thr3 avg_Thr4 avg_Thr5 ];

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 f3 = figure('Name', 'Average Throughput', 'NumberTitle', 'off');           % Figure  
 
 bar(Percentage)
 hold on;
 set(gca,'XTick',1:10:NumUes);
 xlabel('UE Id')
 ylabel('Percentage of UE Throughput Improvemnt [100%]')
 legend ({'NoMLB vs. MLB-Rand'}, 'location', 'best');
 
 title ('Using N = 150, Speed = 5 m/sec, Distance 750m, TxPower = 43.0 dBm  ');

 saveas(f3,'Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_ThrPerUE_10m_Bars_Percentww.png');  % Save plot
 savefig('Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_ThrPerUE_10m_Bars_Percentww.fig');
  
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
