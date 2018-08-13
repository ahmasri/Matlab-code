% time	cellId	IMSI	frame	sframe	RNTI	NumRLF	mcsTb1	sizeTb1	mcsTb2	sizeTb2
clear;
time = 265;
NumUE = 300;
NoCOC1 = COCComputeThrPerUE('Run_28',time,NumUE);
NoCOC2 = COCComputeThrPerUE('Run_30',time,NumUE);
NoCOC3 = COCComputeThrPerUE('Run_32',time,NumUE);
NoCOC4 = COCComputeThrPerUE('Run_34',time,NumUE);
ListNoCOC = [NoCOC1 NoCOC2 NoCOC3 NoCOC4];
%ListNoCOC = [NoCOC2 NoCOC4];

size(ListNoCOC)
AvgNoCOC = mean(ListNoCOC,2)';
size(AvgNoCOC)

size(AvgNoCOC)
COC1 = COCComputeThrPerUE('Run_29',time,NumUE);
COC2 = COCComputeThrPerUE('Run_31',time,NumUE);
COC3 = COCComputeThrPerUE('Run_33',time,NumUE);
COC4 = COCComputeThrPerUE('Run_35',time,NumUE);
ListCOC = [COC1 COC2 COC3 COC4];
%ListCOC = [ COC2  COC4];


AvgCOC = mean(ListCOC,2)';
size(AvgCOC)

Dtmp1    =   mean(AvgNoCOC(1:198),'omitnan');
Dtmp2    =   mean(AvgNoCOC(198:time-2),'omitnan');

Dtmp3    =   mean(AvgCOC(1:198),'omitnan');
Dtmp4    =   mean(AvgCOC(198:time-2),'omitnan');


TimeIndex = 3:1:time;

size(TimeIndex)
size(AvgNoCOC)

% size(Dtmp11)       
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure ONe%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

f1 = figure('Name', 'Global Throughput Per UE Vs. Time', 'NumberTitle', 'off');           % Figure          

plot(TimeIndex,AvgNoCOC,'ob')
hold on;
plot(TimeIndex,AvgCOC,'sr')
hold on;


grid on
set(gca,'XTick',3:10:time);
%set(gca,'YTick',0:10:200);

xlabel('Time [seconds]')
ylabel(' Average UEs Throughput [kbps]')
title ('TCP') ;
hold on;

 line ([0 200]   ,    [Dtmp1 Dtmp1], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
 line ([0 200]   ,    [Dtmp3 Dtmp3], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
legend ({'NoCOC', 'COC', 'Global NoCOC', 'Global COC'}, 'location', 'best');
 hold on;
% 
 line ([200 time] ,    [Dtmp2 Dtmp2], 'LineWidth', 2, 'linestyle', ':', 'color', 'b');
 line ([200 time] ,    [Dtmp4 Dtmp4], 'LineWidth', 2, 'linestyle', '-.', 'color', 'r');
% 
 saveas(f1,'Plots/DlRlcStats_COC_Vs_NoCOC_ThrPerUE_NGBR_TCP_HARQ_5m_multirun.png');  % Save plot
 savefig('Plots/DlRlcStats_COC_Vs_NoCOC_ThrPerUE_NGBR_TCP_HARQ_5m_multirun.fig');

Percentage1 = (Dtmp4 -Dtmp2)/Dtmp4*100 
Percentage2 = (Dtmp1 -Dtmp2)/Dtmp1*100
Percentage3 = (Dtmp3 -Dtmp4)/Dtmp3*100