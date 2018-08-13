function AvgArray = ComputeAvgruns(List,NumEnb,NumOfArrays)
  
  for i = 1:NumEnb
    AvgArray(i) = mean(List(i,:));
  end
  AvgArray = AvgArray';
  end