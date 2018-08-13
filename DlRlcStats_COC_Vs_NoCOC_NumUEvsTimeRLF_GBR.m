
%TCP only and HARQ = off
clear;

array1 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_10/DlRlcStats.txt');
array2 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_11/DlRlcStats.txt');


NumEnbs     = 21;
NumUes      = 300;
TimeIndex   = 3:0.25:49.5;

%take the data instant by instant then compute Global thr per UE and save it for
%that sec

 i = 3.0;

for  j = 1:1:length(TimeIndex)% every 0.25 second all 300 users are scheduled with data
    x = i;
    y = i + 0.25;

    i = i +0.25;
    
    dataTmp1 = array1(le(array1(:,2),y), 1:4);
    tmp1 = dataTmp1(ge(dataTmp1(:,1),x), 1:4);
 
    dataTmp2 = array2(le(array2(:,2),y), 1:4);
    tmp2 = dataTmp2(ge(dataTmp2(:,1),x), 1:4);     
     
     
     
    sorted1 = sortrows(tmp1, 3);   % sort the data by cell Id
    sorted2 = sortrows(tmp2, 3);   % sort the data by cell Id
 
    
    
    
        for k = 1:NumEnbs % how many UEs out from total UEs are in cell k
              Num1(k,j) = sum(sorted1(:,3)== k); % return  Num UEs per cell per time instant 0.25 sec
              Num2(k,j) = sum(sorted2(:,3)== k); % return  Num UEs per cell per time instant
              

        end
 
end


% how many UEs on average  
for i = 1:1:length(TimeIndex)
    GlobalAvgNumUEs1 (i) = mean(Num1(:,i),'omitnan'); 
    GlobalAvgNumUEs2 (i) = mean(Num2(:,i),'omitnan');

    
end
size(3:0.25:25.35)
size(25.35:.25:49.5)


Dtmp1    =   mean(GlobalAvgNumUEs1(1:90),'omitnan');
Dtmp2    =   mean(GlobalAvgNumUEs1(90:187),'omitnan');

Dtmp3    =   mean(GlobalAvgNumUEs2(1:90),'omitnan');
Dtmp4    =   mean(GlobalAvgNumUEs2(90:187),'omitnan') ;



size(TimeIndex)
size(GlobalAvgNumUEs1)
size(GlobalAvgNumUEs2) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

f1 = figure('Name', 'Global Number of UEs Vs. Time', 'NumberTitle', 'off');           % Figure          

plot(TimeIndex,GlobalAvgNumUEs1,'ob')
hold on;
plot(TimeIndex,GlobalAvgNumUEs2,'sr')
hold on;
grid on;
set(gca,'XTick',3:1:50);
%set(gca,'YTick',0:10:200);

xlabel('Time [seconds]')
ylabel(' Average Number of Connected UEs')
title ('TCP') ;

hold on;
line ([0 25.35]   ,    [Dtmp1 Dtmp1], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
line ([0 25.35]   ,    [Dtmp3 Dtmp3], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
legend ({'NoCOC', 'COC', 'Global NoCOC', 'Global COC'}, 'location', 'best');
hold on;
line ([25.35 50] ,    [Dtmp2 Dtmp2], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
line ([25.35 50] ,    [Dtmp4 Dtmp4], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');

saveas(f1,'Plots/DlRlcStats_CoC_Vs_NoCOC_NumUE_5m_Linear_VsTimeRLF_TCP.png');  % Save plot
savefig('Plots/DlRlcStats_CoC_Vs_NoCOC_NumUE_5m_Linear_VsTimeRLF_TCP.fig');

Percentage1 = (Dtmp4 -Dtmp2)/Dtmp4*100 
Percentage2 = (Dtmp1 -Dtmp2)/Dtmp1*100
Percentage3 = (Dtmp3 -Dtmp4)/Dtmp3*100

