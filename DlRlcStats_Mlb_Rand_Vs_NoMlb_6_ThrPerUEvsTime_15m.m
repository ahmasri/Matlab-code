
clear;
array1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_50/DlRlcStats.txt');
array2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_51/DlRlcStats.txt');
j =1;
NumUes = 151;
TimeIndex = 100:1:899;
%take the data Sec by Sec then compute Global thr per UE and save it for
%that sec
for i = 100:899
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
for i = 1:800
GlobalAvgThr1 (i) = (mean(avgThr1(:,i),'omitnan')*0.008); % x 8 bits / 1000 to be [kbps]
GlobalAvgThr2 (i) = (mean(avgThr2(:,i),'omitnan')*0.008);
end

size(TimeIndex)
size(GlobalAvgThr1)
size(GlobalAvgThr2)
        
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

f1 = figure('Name', 'Global Throughput Per UE Vs. Time', 'NumberTitle', 'off');           % Figure          

plot(TimeIndex,GlobalAvgThr1,'ob')
hold on;
plot(TimeIndex,GlobalAvgThr2,'sr')
hold on;
grid on
set(gca,'XTick',100:50:900);
%set(gca,'YTick',0:10:200);

xlabel('Time [seconds]')
ylabel('Global Average UEs Throughput [kbps]')

legend ({'NoMLB', 'MLB-Rand'}, 'location', 'best');

saveas(f1,'Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_ThrPerUE_10m_Linear_VsTime.png');  % Save plot
savefig('Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_ThrPerUE_10m_Linear_VsTime.fig');


