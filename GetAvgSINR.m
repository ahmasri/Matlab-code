function avgSINR = GetAvgSINR(FileName)
new = sprintf('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/%s/DlRsrpSinrStats.txt',FileName);
array = csvread(new);

NumEnb = 9;
Sorted= sortrows(array,2);

 for i =1:NumEnb        
   avgSINR(i) =  mean(Sorted(Sorted(:,2) == i, 6));
 end
end