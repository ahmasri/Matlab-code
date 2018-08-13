function output = COCComputeThrPerUE(FileName,time,NumUEs)
%TCP only with HARQ ON

 new = sprintf('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/%s/DlRlcStats.txt',FileName);
 array = csvread(new);
j =1;



%take the data Sec by Sec then compute Global thr per UE and save it for
%that sec
for i = 3:time
     x = i;
     y = i + 0.75;
     tmp = getLimit(array, x, y , 1, 10); % return data from col 1 - 10 within limits x and y in time
     sorted = sortrows(tmp, 4);   % sort the data by UE Id
   
        for k = 1:NumUEs
              Dump = sorted(sorted(:, 4) == k, 10); % retrun all dataRx bytes transmitted for  UE = k
               %Avg Thr Per UE
              avgThr(k, j) =  mean(Dump,'omitnan'); % Row UE k x Col j Avg Thr UE 
          
        end
         j = j+1;
end

size(avgThr);
% each col in avgThr contains all avg Throughputs for UEs from 1 to NumUEs
% in one second.
% to compute Global UE throughput per Second.
T = time-2;
for i = 1:T
tmp2 (i) = (mean(avgThr(:,i),'omitnan')*0.008); % x 8 bits / 1000 to be [kbps]
end

output = tmp2';

end      
