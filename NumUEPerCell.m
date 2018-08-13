% return num of UEs per cell
function Num = NumUEPerCell(data)
  
  sorted = sortrows(data, 3);
  Num = zeros(9,1);
  for i = 1:9
      Num(i) = sum(sorted(:,3)== i); % return (NumEnbs X 1) vector
  end
end