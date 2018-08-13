function avgPRB = GetAvgPRB(FileName)
new = sprintf('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/MLB/%s/DlMACStats.csv',FileName);
array = csvread(new);

NumEnb = 9;
   sorted1 = sortrows(array, 2);   % sort the data by cell Id
  
        for i = 1:NumEnb
              tmp = sorted1(sorted1(:,2)==i,7); % retrun all PRBs transmitted for  UE = i
              avgPRB(i) =  mean(tmp,'omitnan');
        end