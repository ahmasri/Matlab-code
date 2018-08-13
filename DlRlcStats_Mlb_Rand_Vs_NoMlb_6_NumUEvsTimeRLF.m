
%clear;

array1      = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_2/DlRlcStats.csv');
array2      = csvread('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/Run_3/DlRlcStats.csv');

NumEnbs     = 21;
NumUes      = 300;
TimeIndex   = 3:0.25:299.5;

%take the data instant by instant then compute Global thr per UE and save it for
%that sec

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
size(3:0.25:200)
size(200:0.25:299.5)
size(GlobalAvgNumUEs1)

tmp1    =   mean(GlobalAvgNumUEs1(1:789),'omitnan');
tmp2    =   mean(GlobalAvgNumUEs1(789:1187),'omitnan');

tmp3    =   mean(GlobalAvgNumUEs2(1:789),'omitnan');
tmp4    =   mean(GlobalAvgNumUEs2(789:1187),'omitnan') ;

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
set(gca,'XTick',3:10:300);
%set(gca,'YTick',0:10:200);

xlabel('Time [seconds]')
ylabel(' Average Number of Connected UEs')


hold on;
line ([0 200]   ,    [tmp1 tmp1], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
line ([0 200]   ,    [tmp3 tmp3], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
legend ({'NoCOC', 'COC', 'Global NoCOC', 'Global COC'}, 'location', 'best');
hold on;
line ([201 300] ,    [tmp2 tmp2], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
line ([201 300] ,    [tmp4 tmp4], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');

saveas(f1,'Plots/DlRlcStats_CoC_Vs_NoCOC_NumUE_5m_Linear_VsTimeRLF.png');  % Save plot
savefig('Plots/DlRlcStats_CoC_Vs_NoCOC_NumUE_5m_Linear_VsTimeRLF.fig');

Percentage1 = (tmp4 -tmp2)/tmp4*100 
Percentage2 = (tmp1 -tmp2)/tmp1*100
Percentage3 = (tmp3 -tmp4)/tmp3*100
