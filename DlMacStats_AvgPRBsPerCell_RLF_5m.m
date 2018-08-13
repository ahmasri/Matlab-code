% time	cellId	IMSI	frame	sframe	RNTI	NumPRBs	mcsTb1	sizeTb1	mcsTb2	sizeTb2
clear;
array1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_2/DlMacStats.txt');
array2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_3/DlMacStats.txt');
%array3 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_19p/DlRlcStats.csv');
%array4 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_20p/DlRlcStats.csv');
%array5 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_21p/DlRlcStats.csv');
TimeIndex = 3:1:299;
NumEnb = 21;
j =1;
for i = 3:1:299
    x = i;
    y = i +1;
        dataTmp1 = array1(lt(array1(:,1),y), 1:8); % it should be column 7 but there is extra ',' by mistake in the Run_2/DlMacStats.txt
        data1 = dataTmp1(ge(dataTmp1(:,1),x), 8);
     
        dataTmp2 = array2(lt(array2(:,1),y), 1:8);% it should be column 7 but there is extra ',' by mistake in the Run_3/DlMacStats.txt
        data2 = dataTmp2(ge(dataTmp2(:,1),x), 8); 
        
        avgPRB1(j) = mean(data1,'omitnan');
        avgPRB2(j) = mean(data2,'omitnan');
        j = j+1;
end

tmp1    =   mean(avgPRB1(1:200),'omitnan');
tmp2    =   mean(avgPRB1(201:297),'omitnan');
tmp3    =   mean(avgPRB2(1:200),'omitnan');
tmp4    =   mean(avgPRB2(201:297),'omitnan');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

f1 = figure('Name', 'PRBs Usage Vs. Time', 'NumberTitle', 'off');           % Figure          

 plot(TimeIndex,avgPRB1,'ob')
 hold on;
 plot(TimeIndex,avgPRB2,'sr')
% 
  hold on;
grid on
set(gca,'XTick',3:10:300);
%set(gca,'YTick',0:10:200);

xlabel('Time [seconds]')
ylabel(' Average PRBs Usage')

hold on;
% j = 1;
% for i = 1:297
%   if mod(i,10) == 0
%     line ([i i+10 ] ,    [Dtmp11(j) Dtmp11(j)], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
%     line ([i i+10 ] ,    [Dtmp22(j) Dtmp22(j)], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
%     j = j+1;
%  end
% end
%, 'Global NoCOC', 'Global COC'
legend ({'NoCOC', 'COC'}, 'location', 'best');
line ([0 200]   ,    [tmp1 tmp1], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
 line ([0 200]   ,    [tmp3 tmp3], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');

 hold on;
 line ([201 300] ,    [tmp2 tmp2], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
 line ([201 300] ,    [tmp4 tmp4], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
%  
saveas(f1,'Plots/DlMacStats_COC_Vs_NoCOC_PRB_5m_Linear_VsTimeRLF_NGBR.png');  % Save plot
savefig('Plots/DlMacStats_COC_Vs_NoCOC_PRB_5m_Linear_VsTimeRLF_NGBR.fig');

Percentage1 = (tmp4 -tmp2)/tmp4*100 
Percentage2 = (tmp1 -tmp2)/tmp1*100
Percentage3 = (tmp3 -tmp4)/tmp3*100


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5555
%    sorted1 = sortrows(array1, 2);   % sort the data by cell Id
%    sorted2 = sortrows(array2, 2);   % sort the data by cell Id
%   
%         for i = 1:NumEnb
%               tmp1 = sorted1(sorted1(:,2)==i,7); % retrun all PRBs transmitted for  UE = i
%               tmp2 = sorted2(sorted2(:,2)==i,7); % retrun all PRBs transmitted for  UE = i
%               avgThr1(i) =  mean(tmp1);
%               avgThr2(i) =  mean(tmp2);
%         end
%         
%  CellIds = 1:1:21;
% 
%  
%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure One%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f1 = figure('Name', 'PRBs Per Cell', 'NumberTitle', 'off');           % Figure          
% 
% plot_data2 = [(avgThr1)' (avgThr2 )' ];
% 
% plot_data = [CellIds' (avgThr1)' (avgThr2)' ];
% %csvwrite('PRBs Per Cell_10m.csv',plot_data);
% 
% 
% avg_Thr1 = mean(plot_data(:,2));
% avg_Thr2 = mean(plot_data(:,3));
% % avg_Thr3 = mean(plot_data(:,4));
% % avg_Thr4 = mean(plot_data(:,5));
% % avg_Thr5 = mean(plot_data(:,6));
% %avg_Thr6 = mean(plot_data(:,7));
% avg_Thr =[avg_Thr1 avg_Thr2 ];%avg_Thr3 avg_Thr4 avg_Thr5 ];
% %csvwrite('PRBs Per Cell.csv',avg_Thr);
% 
% percentage = ((avg_Thr1-avg_Thr2)/avg_Thr1)*100 
% 
% plot(plot_data(:,1),plot_data(:,2),'-or')
% hold on;
% plot(plot_data(:,1),plot_data(:,3),'-.xb')
% 
% % plot(plot_data(:,1),plot_data(:,4),'--pg')
% % hold on;
% % plot(plot_data(:,1), plot_data(:,5),'-*k')
% % hold on;
% % plot(plot_data(:,1), plot_data(:,6),'--<m')
% % hold on;
% 
% 
% 
% %line ([0 UEIds], [avg_Thr1 avg_Thr1], 'linestyle', '-', 'color', 'r');
% %line ([0 UEIds], [avg_Thr2 avg_Thr2], 'linestyle', '-.', 'color', 'b');
% % line ([0 9], [avg_Thr3 avg_Thr3], 'linestyle', '--', 'color', 'g');
% % line ([0 9], [avg_Thr4 avg_Thr4], 'linestyle', '-', 'color', 'k');
% % line ([0 9], [avg_Thr5 avg_Thr5], 'linestyle', '--', 'color', 'm');
% % %line ([0 9], [avg_Thr6 avg_Thr6], 'linestyle', '-', 'color', 'y');
% hold on;
% 
% set(gca,'XTick',1:1:9);
% set(gca,'YTick',20:2:30);
% xlabel('Cell Id')
% 
% ylabel('Average PRBs Usage Per Cell')
% 
% legend ({'NoCOC', 'COC'}, 'location', 'northeastoutside');
% 
% 1:1:9})
%  xlabel('Cell Ids')
%  ylabel('Average PRBs Usage Per Cell')
%  legend ({'NoCOC', 'COC'}, 'location', 'best');
%  
%  title ('Using N = 300, Speed = 5 m/sec, Distance 750m, TxPower = 43.0 dBm  ');
% 
% saveas(3,'Plots/DlMacStats_AvgPRBsPerCell_10m_Bars_RLF_NGBR.png');  % Save plot
% savefig('Plots/DlMacStats_AvgPRBsPerCell_10m_Basr_RLF_NGBR.fig');
% saveas(f1,'Plots/DlMacStats_AvgPRBsPerCell_10m_linear_RLF_NGBR.png');  % Save plot
% savefig('Plots/DlMacStats_AvgPRBsPerCell_10m_linear_RLF_NGBR.fig');
%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Two%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   
% f2 = figure('Name', 'Global average PRBs Usage', 'NumberTitle', 'off');           % Figure  
% 
% tmp =[avg_Thr(1) avg_Thr(2)];% avg_Thr(3) avg_Thr(4)  avg_Thr(5)];
% bar(tmp');
% hold on;
% set (gca, 'xticklabel', {'NoCOC', 'COC'})
% set(gca,'YTick',20:2:30);
% %xlabel('MLB Support ')
% ylabel('Global Average PRBs Usage')
% title ('Using N = 300, Speed = 5 m/sec, Distance 750m, TxPower = 43.0 dBm  ');
% %set (h2, 'fontsize', 12);
% saveas(f2,'Plots/DlMacStats_GlobalAvgPRBsPerCell_10m_linear_RLF_NGBR.png');  % Save plot
% savefig('Plots/DlMacStats_GlobalAvgPRBsPerCell_10m_linear_RLF_NGBR.fig');
% 
% 
%    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure Three%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    
%  f3 = figure('Name', 'Average Throughput', 'NumberTitle', 'off');           % Figure  
% 
%  bar(plot_data2)
%  hold on;
%  set (gca, 'xticklabel', {1:1:9})
%  xlabel('Cell Ids')
%  ylabel('Average PRBs Usage Per Cell')
%  legend ({'NoCOC', 'COC'}, 'location', 'best');
%  
%  title ('Using N = 300, Speed = 5 m/sec, Distance 750m, TxPower = 43.0 dBm  ');
% 
% saveas(3,'Plots/DlMacStats_AvgPRBsPerCell_10m_Bars_RLF_NGBR.png');  % Save plot
% savefig('Plots/DlMacStats_AvgPRBsPerCell_10m_Basr_RLF_NGBR.fig');
  
  
 
