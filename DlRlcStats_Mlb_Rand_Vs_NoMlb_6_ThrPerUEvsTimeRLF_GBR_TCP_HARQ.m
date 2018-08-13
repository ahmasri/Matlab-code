%TCP only with HARQ ON
clear;
array1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_14/DlRlcStats.txt');
array2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_15/DlRlcStats.txt');


j =1;
NumUes = 300;
TimeIndex = 3:1:50;
%take the data Sec by Sec then compute Global thr per UE and save it for
%that sec
for i = 3:50
    x = i;
     y = i + 0.75;
     tmp1 = getLimit(array1, x, y , 1, 10); % return data from col 1 - 10 within limits x and y in time
     tmp2 = getLimit(array2, x, y , 1, 10); % return data from col 1 - 10 within limits x and y in time
     
     
%     dataTmp1 = array1(le(array1(:,2),y), 1:10);
%     tmp1 = dataTmp1(ge(dataTmp1(:,1),x), 1:10);
%  
%     dataTmp2 = array2(le(array2(:,2),y), 1:10);
%     tmp2 = dataTmp2(ge(dataTmp2(:,1),x), 1:10);
% 
%     dataTmp3 = array3(le(array3(:,2),y), 1:10);
%     tmp3 = dataTmp3(ge(dataTmp3(:,1),x), 1:10);
%  
%     dataTmp4 = array4(le(array4(:,2),y), 1:10);
%     tmp4 = dataTmp4(ge(dataTmp4(:,1),x), 1:10);  
%     
    
    
    sorted1 = sortrows(tmp1, 4);   % sort the data by UE Id
    sorted2 = sortrows(tmp2, 4);   % sort the data by UE Id
     
        for k = 1:NumUes
            
              Dump1 = sorted1(sorted1(:, 4) == k, 10); % retrun all dataRx bytes transmitted for  UE = k
              Dump2 = sorted2(sorted2(:, 4) == k, 10); % retrun all dataRx bytes transmitted for  UE = k

               %Avg Thr Per UE
              avgThr1(k, j) =  mean(Dump1,'omitnan'); % Row UE k x Col j Avg Thr UE 
              avgThr2(k, j) =  mean(Dump2,'omitnan');
            
             
        end
         j = j+1;
end

size(avgThr1)
size(avgThr2)
% each col in avgThr contains all avg Throughputs for UEs from 1 to NumUEs
% in one second.
% to compute Global UE throughput per Second.
j =1;
for i = 1:48
GlobalAvgThr1 (i) = (mean(avgThr1(:,i),'omitnan')*0.008); % x 8 bits / 1000 to be [kbps]
GlobalAvgThr2 (i) = (mean(avgThr2(:,i),'omitnan')*0.008);
%     if mod(i,3) == 0
%         Dtmp11(j) = mean(GlobalAvgThr1(i-2:i),'omitnan');
%         Dtmp22(j) = mean(GlobalAvgThr2(i-2:i),'omitnan');
%         j= j+1;
%     end
end

Dtmp1    =   mean(GlobalAvgThr1(1:23),'omitnan');
Dtmp2    =   mean(GlobalAvgThr1(23:48),'omitnan');
Dtmp3    =   mean(GlobalAvgThr2(1:23),'omitnan');
Dtmp4    =   mean(GlobalAvgThr2(23:48),'omitnan');
Dtmp5    =   mean(GlobalAvgThr2(23:25),'omitnan');
Dtmp6    =   mean(GlobalAvgThr2(25:48),'omitnan');


size(TimeIndex)
size(GlobalAvgThr1)
size(GlobalAvgThr2)
% size(Dtmp11)       
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

f1 = figure('Name', 'Global Throughput Per UE Vs. Time', 'NumberTitle', 'off');           % Figure          

plot(TimeIndex,GlobalAvgThr1,'ob')
hold on;
plot(TimeIndex,GlobalAvgThr2,'sr')
hold on;
% plot(TimeIndex,Dtmp11,'-pg')
% hold on;
% plot(TimeIndex,Dtmp22,':>m')
% hold on;

grid on
set(gca,'XTick',3:1:50);
%set(gca,'YTick',0:10:200);

xlabel('Time [seconds]')
ylabel(' Average UEs Throughput [kbps]')
title ('TCP') ;
hold on;
% j = 1;
% for i = 1:48
%   if mod(i,3) == 0
%     line ([i i+3 ] ,    [Dtmp11(j) Dtmp11(j)], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
%     line ([i i+3 ] ,    [Dtmp22(j) Dtmp22(j)], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
%     j = j+1;
%  end
% end
 line ([0 25.35]   ,    [Dtmp1 Dtmp1], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
 line ([0 25.35]   ,    [Dtmp3 Dtmp3], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
legend ({'NoCOC', 'COC', 'Global NoCOC', 'Global COC'}, 'location', 'best');
 hold on;
% 
 line ([25.36 50] ,    [Dtmp2 Dtmp2], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
 line ([25.36 50] ,    [Dtmp4 Dtmp4], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
% 
 saveas(f1,'Plots/DlRlcStats_COC_Vs_NoCOC_ThrPerUE_5m_Linear_VsTimeRLF_GBR_TCP_HARQ.png');  % Save plot
 savefig('Plots/DlRlcStats_COC_Vs_NoCOC_ThrPerUE_5m_Linear_VsTimeRLF_GBR_TCP_HARQ.fig');

Percentage1 = (Dtmp4 -Dtmp2)/Dtmp4*100 
Percentage2 = (Dtmp1 -Dtmp2)/Dtmp1*100
Percentage3 = (Dtmp3 -Dtmp4)/Dtmp3*100
       
