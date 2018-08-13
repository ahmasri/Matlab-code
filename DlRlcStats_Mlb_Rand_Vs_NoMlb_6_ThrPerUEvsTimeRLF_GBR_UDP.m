
clear;

array3 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_12/DlRlcStats.txt');
array4 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_13/DlRlcStats.txt');

j =1;
NumUes = 300;
TimeIndex = 3:1:50;
%take the data Sec by Sec then compute Global thr per UE and save it for
%that sec
for i = 3:50
    x = i;
     y = i + 0.25;

   


    dataTmp3 = array3(le(array3(:,2),y), 1:10);
    tmp3 = dataTmp3(ge(dataTmp3(:,1),x), 1:10);
 
    dataTmp4 = array4(le(array4(:,2),y), 1:10);
    tmp4 = dataTmp4(ge(dataTmp4(:,1),x), 1:10);  
    
    
    

    sorted3 = sortrows(tmp3, 4);   % sort the data by UE Id
    sorted4 = sortrows(tmp4, 4);   % sort the data by UE Id    
        for k = 1:NumUes
            

              Dump3= sorted3(sorted3(:, 4) == k, 10); % retrun all dataRx bytes transmitted for  UE = k
              Dump4 = sorted4(sorted4(:, 4) == k, 10); % retrun all dataRx bytes transmitted for  UE = k
               %Avg Thr Per UE

              avgThr3(k, j) =  mean(Dump3,'omitnan'); % Row UE k x Col j Avg Thr UE
              avgThr4(k, j) =  mean(Dump4,'omitnan');
             
        end
         j = j+1;
end
size(avgThr3)
size(avgThr4)
% each col in avgThr contains all avg Throughputs for UEs from 1 to NumUEs
% in one second.
% to compute Global UE throughput per Second.
for i = 1:48

GlobalAvgThr3 (i) = (mean(avgThr3(:,i),'omitnan')*0.008); % x 8 bits / 1000 to be [kbps]
GlobalAvgThr4 (i) = (mean(avgThr4(:,i),'omitnan')*0.008);
end



Dtmp5    =   mean(GlobalAvgThr3(1:25),'omitnan')
Dtmp6    =   mean(GlobalAvgThr3(25:48),'omitnan')
Dtmp7    =   mean(GlobalAvgThr4(1:25),'omitnan')
Dtmp8    =   mean(GlobalAvgThr4(25:48),'omitnan')
size(TimeIndex)
size(GlobalAvgThr3)
size(GlobalAvgThr4)
        
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

f1 = figure('Name', 'Global Throughput Per UE Vs. Time', 'NumberTitle', 'off');           % Figure          

plot(TimeIndex,GlobalAvgThr3,'ob')
hold on;
plot(TimeIndex,GlobalAvgThr4,'sr')

 hold on;
grid on
set(gca,'XTick',3:1:50);
%set(gca,'YTick',0:10:200);

xlabel('Time [seconds]')
ylabel(' Average UEs Throughput [kbps]')
title ('UDP') ;
hold on;
line ([0 25.35]   ,    [Dtmp5 Dtmp5], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
line ([0 25.35]   ,    [Dtmp7 Dtmp7], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
legend ({'NoCOC', 'COC', 'Global NoCOC', 'Global COC'}, 'location', 'best');
hold on;
line ([25.36 50] ,    [Dtmp6 Dtmp6], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
line ([25.36 50] ,    [Dtmp8 Dtmp8], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
 
saveas(f1,'Plots/DlRlcStats_COC_Vs_NoCOC_ThrPerUE_5m_Linear_VsTimeRLF_GBR_UDP.png');  % Save plot
savefig('Plots/DlRlcStats_COC_Vs_NoCOC_ThrPerUE_5m_Linear_VsTimeRLF_GBR_UDP.fig');

Percentage1 = (Dtmp8 -Dtmp6)/Dtmp8*100 
Percentage2 = (Dtmp5 -Dtmp6)/Dtmp5*100
Percentage3 = (Dtmp7 -Dtmp8)/Dtmp7*100


