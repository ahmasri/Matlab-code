
clear;
array1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_2/DlRlcStats.csv');
array2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_3/DlRlcStats.csv');
j =1;
NumUes = 300;
TimeIndex = 3:1:299;
%take the data Sec by Sec then compute Global thr per UE and save it for
%that sec
for i = 3:299
    x = i;
    y = i + 0.75;
    tmp1 = getLimit(array1, x, y , 1, 10); % return data from col 1 - 10 within limits x and y in time
    tmp2 = getLimit(array2, x, y , 1, 10); % return data from col 1 - 10 within limits x and y in time
    
    sorted1 = sortrows(tmp1, 4);   % sort the data by UE Id
    sorted2 = sortrows(tmp2, 4);   % sort the data by UE Id
    
        for k = 1:NumUes
            
              Dump1 = sorted1(sorted1(:, 4) == k, 10); % retrun all dataRx bytes transmitted for  UE = k
              Dump2 = sorted2(sorted2(:, 4) == k, 10); % retrun all dataRx bytes transmitted for  UE = k
               %Avg Thr Per UE
              avgThr1(k, j) =  mean(Dump1,'omitnan'); % Row time i x Col k Avg Thr UE 
              avgThr2(k, j) =  mean(Dump2,'omitnan');
             
        end
         j = j+1;
end

% each col in avgThr contains all avg Throughputs for UEs from 1 to NumUEs
% in one second.
% to compute Global UE throughput per Second.
j = 1;
for i = 1:297
GlobalAvgThr1 (i) = (mean(avgThr1(:,i),'omitnan')*0.008); % x 8 bits / 1000 to be [kbps]
GlobalAvgThr2 (i) = (mean(avgThr2(:,i),'omitnan')*0.008);


    if mod(i,10) == 0
        Dtmp11(j) = mean(GlobalAvgThr1(i-9:i),'omitnan');
        Dtmp22(j) = mean(GlobalAvgThr2(i-9:i),'omitnan');
        j= j+1;
    end
end
tmp1    =   mean(GlobalAvgThr1(1:200),'omitnan')
tmp2    =   mean(GlobalAvgThr1(201:297),'omitnan')
tmp3    =   mean(GlobalAvgThr2(1:200),'omitnan')
tmp4    =   mean(GlobalAvgThr2(201:297),'omitnan')
size(TimeIndex)
size(GlobalAvgThr1)
size(GlobalAvgThr2)
        
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

f1 = figure('Name', 'Global Throughput Per UE Vs. Time', 'NumberTitle', 'off');           % Figure          

% plot(TimeIndex,GlobalAvgThr1,'ob')
% hold on;
% plot(TimeIndex,GlobalAvgThr2,'sr')
% 
%  hold on;
grid on
set(gca,'XTick',3:10:300);
%set(gca,'YTick',0:10:200);

xlabel('Time [seconds]')
ylabel(' Average UEs Throughput [kbps]')

hold on;
j = 1;
for i = 1:297
  if mod(i,10) == 0
    line ([i i+10 ] ,    [Dtmp11(j) Dtmp11(j)], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
    line ([i i+10 ] ,    [Dtmp22(j) Dtmp22(j)], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
    j = j+1;
 end
end
%, 'Global NoCOC', 'Global COC'
legend ({'NoCOC', 'COC'}, 'location', 'best');
line ([0 200]   ,    [tmp1 tmp1], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
 line ([0 200]   ,    [tmp3 tmp3], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');

 hold on;
 line ([201 300] ,    [tmp2 tmp2], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
 line ([201 300] ,    [tmp4 tmp4], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
%  
saveas(f1,'Plots/DlRlcStats_COC_Vs_NoCOC_ThrPerUE_5m_Linear_VsTimeRLF.png');  % Save plot
savefig('Plots/DlRlcStats_COC_Vs_NoCOC_ThrPerUE_5m_Linear_VsTimeRLF.fig');

Percentage1 = (tmp4 -tmp2)/tmp4*100 
Percentage2 = (tmp1 -tmp2)/tmp1*100
Percentage3 = (tmp3 -tmp4)/tmp3*100

