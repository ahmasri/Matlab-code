
clear;
array1      = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_22p/DlRlcStats.csv');
array2      = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/Run_23p/DlRlcStats.csv');
NumEnbs     = 9;
NumUes      = 151;
TimeIndex   = 100:0.25:599.5;
%take the data Sec by Sec then compute Global thr per UE and save it for
%that sec
TotalSum1 = 0;
TotalSum2 = 0;
 i = 3.0;

for  j = 1:1:length(TimeIndex)% every 0.25 second all 150 users are scheduled with data
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
for i = 1:10
    Num1(:,i)
end

   
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
set(gca,'XTick',100:20:600);
%set(gca,'YTick',0:10:200);

xlabel('Time [seconds]')
ylabel('Global Average Number of Connected UEs')

legend ({'NoMLB', 'MLB-Rand'}, 'location', 'best');

saveas(f1,'Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_NumUE_10m_Linear_VsTime.png');  % Save plot
savefig('Plots/DlRlcStats_Mlb_Rand_Vs_NoMlb_6_NumUE_10m_Linear_VsTime.fig');


