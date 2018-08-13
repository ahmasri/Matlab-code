
clear;


array3 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_12/DlRlcStats.txt');
array4 = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_13/DlRlcStats.txt');

NumEnbs     = 21;
NumUes      = 300;
TimeIndex   = 1:1:50;

%take the data instant by instant then compute Global thr per UE and save it for
%that sec

 i = 1.0;

for  j = 1:1:length(TimeIndex)% every 0.25 second all 150 users are scheduled with data
    x = i;
    y = i + 0.25;
    i = i +1;
    


    dataTmp3 = array3(le(array3(:,2),y), 1:4);
    tmp3 = dataTmp3(ge(dataTmp3(:,1),x), 1:4);
 
    dataTmp4 = array4(le(array4(:,2),y), 1:4);
    tmp4 = dataTmp4(ge(dataTmp4(:,1),x), 1:4);    

    
    sorted3 = sortrows(tmp3, 3);   % sort the data by cell Id
    sorted4 = sortrows(tmp4, 3);   % sort the data by cell Id
    
    
    
        for k = 1:NumEnbs % how many UEs out from total UEs are in cell k

              
              Num3(k,j) = sum(sorted3(:,3)== k); % return  Num UEs per cell per time instant 0.25 sec
              Num4(k,j) = sum(sorted4(:,3)== k); % return  Num UEs per cell per time instant
        end
 
end


% how many UEs on average  
for i = 1:1:length(TimeIndex)
  
    GlobalAvgNumUEs3 (i) = mean(Num3(:,i),'omitnan');
    GlobalAvgNumUEs4 (i) = mean(Num4(:,i),'omitnan');
end
size(3:1:25)
size(25:1:50)




Dtmp5    =   mean(GlobalAvgNumUEs3(1:25),'omitnan');
Dtmp6    =   mean(GlobalAvgNumUEs3(25:50),'omitnan');

Dtmp7    =   mean(GlobalAvgNumUEs4(1:25),'omitnan');
Dtmp8    =   mean(GlobalAvgNumUEs4(25:50),'omitnan');

size(TimeIndex)
size(GlobalAvgNumUEs3)
size(GlobalAvgNumUEs4) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

f2 = figure('Name', 'Global Number of UEs Vs. Time', 'NumberTitle', 'off');           % Figure          

plot(TimeIndex,GlobalAvgNumUEs3,'ob')
hold on;
plot(TimeIndex,GlobalAvgNumUEs4,'sr')
hold on;
grid on;
set(gca,'XTick',1:1:50);
%set(gca,'YTick',0:10:200);

xlabel('Time [seconds]')
ylabel(' Average Number of Connected UEs')

title ('UDP') ;
hold on;
line ([0 25.35]   ,    [Dtmp5 Dtmp5], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
line ([0 25.35]   ,    [Dtmp7 Dtmp7], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
legend ({'NoCOC', 'COC', 'Global NoCOC', 'Global COC'}, 'location', 'best');
hold on;
line ([25.35 50] ,    [Dtmp6 Dtmp6], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
line ([25.35 50] ,    [Dtmp8 Dtmp8], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');

saveas(f2,'Plots/DlRlcStats_CoC_Vs_NoCOC_NumUE_5m_Linear_VsTimeRLF_UDP.png');  % Save plot
savefig('Plots/DlRlcStats_CoC_Vs_NoCOC_NumUE_5m_Linear_VsTimeRLF_UDP.fig');

Percentage1 = (Dtmp8 -Dtmp6)/Dtmp8*100 
Percentage2 = (Dtmp5 -Dtmp6)/Dtmp5*100
Percentage3 = (Dtmp7 -Dtmp8)/Dtmp7*100

