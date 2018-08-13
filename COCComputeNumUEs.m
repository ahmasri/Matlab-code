function output = COCComputeNumUEs(FileName,time,NumEnbs)
%TCP only with HARQ ON

 new = sprintf('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/%s/DlRlcStats.txt',FileName);
 array = csvread(new);
 
 %take the data instant by instant then compute Global thr per UE and save it for
%that sec

 i = 3.0;
for  j = 1:1:time% every 0.25 second all 300 users are scheduled with data
    x = i;
    y = i + 0.25;
    i = i +0.25;
    
    dataTmp = array(le(array(:,2),y), 1:4);
    tmp = dataTmp(ge(dataTmp(:,1),x), 1:4);

    sorted = sortrows(tmp, 3);   % sort the data by cell Id

        for k = 1:NumEnbs % how many UEs out from total UEs are in cell k
              Num(k,j) = sum(sorted(:,3)== k); % return  Num UEs per cell per time instant 0.25 sec

        end
end
% how many UEs on average  
for i = 1:1:time
    GlobalAvgNumUEs1 (i) = mean(Num(:,i),'omitnan'); 
 
end
output = GlobalAvgNumUEs1';
end
