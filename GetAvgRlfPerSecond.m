function RLFPerSecond = GetAvgRlfPerSecond(FileName,type)

    if type == 1
        new = sprintf('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/%s/DlRlcStats.txt',FileName);
    else
      new = sprintf('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/%s/DlRlcStats.csv',FileName);  
    end

    array = csvread(new);

    NumEnb = 21;
   
   
   %RLF vs Time
   for i = 3:299 % from 3 seconds to 10 minutes
       x = i;
       y = i+0.75;
       tmp = getLimit(array, x, y , 1, 10);
       RLFPerSecond(i) = sum(tmp(:,10) == 0 | (tmp(:,8)-tmp(:,10)./tmp(:,8) > 0.5) );
   end
   
   


end