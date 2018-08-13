function filteredData =filterInput_10m (UnfilteredData,sortby, col)
  %filter the data
NumEnb = 9;
  % return avg number of UEs per cell for one second
  % UES in column 4 already sorted
  % get UEs per second
if col == 4 
     for i = 3:599 % from 3 seconds to 10 minutes
       x = i;
       y = i+0.75;
       tmp = getLimit(UnfilteredData, x, y , 1, 4);
       %tmp2  = RemoveNAN(tmp,4); % Becareful using this function because
                                  % it will change the size
       sorted = sortrows(tmp, 3);
       
       for j =1:NumEnb

          filteredDataTmp(i,j) = sum(sorted(:,3)== j);
       
       end
     end
        
        filteredData = filteredDataTmp';
                     
elseif col == 10 % return the global throughput (RxData bytes) per cell.

  sorted = sortrows(UnfilteredData, sortby);   % sort the data by cell Id
 
        for i = 1:NumEnb
          tmp = sorted(sorted(:,sortby)==i,col); % retrun all dataRx bytes transmitted from  cell = i
          %tmp = RemoveNAN(tmp,1);
          avgThr(i) =  mean(tmp);
        end
        
        filteredData =  avgThr';
 
end

       end