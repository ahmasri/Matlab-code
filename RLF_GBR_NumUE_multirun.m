
%TCP only and HARQ = ON

clear;
time = 265;
NumEnbs = 21;
TimeIndex   = 3:0.25:time;
timeLenghth = length(TimeIndex);
NoCOC1 = COCComputeNumUEs('Run_20',timeLenghth,NumEnbs);
NoCOC2 = COCComputeNumUEs('Run_22',timeLenghth,NumEnbs);
NoCOC3 = COCComputeNumUEs('Run_24',timeLenghth,NumEnbs);
NoCOC4 = COCComputeNumUEs('Run_26',timeLenghth,NumEnbs);
ListNoCOC = [NoCOC1 NoCOC2 NoCOC3 NoCOC4];

AvgNoCOC = mean(ListNoCOC,2)';
size(AvgNoCOC)

COC1 = COCComputeNumUEs('Run_21',timeLenghth,NumEnbs);
size(COC1)
COC2 = COCComputeNumUEs('Run_23',timeLenghth,NumEnbs);
COC3 = COCComputeNumUEs('Run_25',timeLenghth,NumEnbs);
COC4 = COCComputeNumUEs('Run_27',timeLenghth,NumEnbs);
ListCOC = [COC1 COC2 COC3 COC4];
size(ListCOC)
AvgCOC = mean(ListCOC,2)';
size(AvgCOC)


T1 =  size(3:0.25:200);
T2 =  size(3:.25:time);

Dtmp1    =   mean(AvgNoCOC(1:T1),'omitnan');
Dtmp2    =   mean(AvgNoCOC(T1:T2),'omitnan');

Dtmp3    =   mean(AvgCOC(1:T1),'omitnan');
Dtmp4    =   mean(AvgCOC(T1:T2),'omitnan') ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

f1 = figure('Name', 'Global Number of UEs Vs. Time', 'NumberTitle', 'off');           % Figure          

plot(TimeIndex,AvgNoCOC,'ob')
hold on;
plot(TimeIndex,AvgCOC,'sr')
hold on;
grid on;
set(gca,'XTick',3:10:time);
%set(gca,'YTick',0:10:200);

xlabel('Time [seconds]')
ylabel(' Average Number of Connected UEs')
%title ('TCP') ;

hold on;
line ([0 200]   ,    [Dtmp1 Dtmp1], 'LineWidth', 3, 'linestyle', ':', 'color', 'b');
line ([0 200]   ,    [Dtmp3 Dtmp3], 'LineWidth', 3, 'linestyle', '-.', 'color', 'r');
legend ({'NoCOC', 'COC', 'Global NoCOC', 'Global COC'}, 'location', 'best');
hold on;
line ([200 time] ,    [Dtmp2 Dtmp2], 'LineWidth', 3, 'linestyle', ':', 'color', 'b');
line ([200 time] ,    [Dtmp4 Dtmp4], 'LineWidth', 3, 'linestyle', '-.', 'color', 'r');

saveas(f1,'Plots/DlRlcStats_COC_Vs_NoCOC_NumUE_GBR_TCP_HARQ_5m_multirun.png');  % Save plot
savefig('Plots/DlRlcStats_COC_Vs_NoCOC_NumUE_GBR_TCP_HARQ_5m_multirun.fig');

Percentage1 = ((Dtmp4 -Dtmp2)/Dtmp4)*100 
Percentage2 = (Dtmp1 -Dtmp2)/Dtmp1*100
Percentage3 = (Dtmp3 -Dtmp4)/Dtmp3*100

