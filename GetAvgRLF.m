function avgRLF = GetAvgRLF(FileName,type)

    if type == 1
        new = sprintf('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/%s/DlRlcStats.txt',FileName);
    else
      new = sprintf('/home/ahmasri/ns-allinone-3.26/ns-3.26/Official_collection_Of_Results/RLF/%s/DlRlcStats.csv',FileName);  
    end

    array = csvread(new);

    NumEnb = 21;
    Sorted= sortrows(array,3);

   for i = 1:1:NumEnb
      
         List = Sorted(Sorted(:,3) == i,1:10);
         avgRLF(i) = sum(List(:,10) == 0);% | (List(:,8)-List(:,10)./List(:,8) > 0.5) );
        
   end
   
  

end