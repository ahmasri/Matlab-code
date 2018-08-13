function data = getLimit(comp, x, y, colStart, colEnd)
  
 dataTmp = comp(le(comp(:,1),y), colStart:colEnd);
 data = dataTmp(ge(dataTmp(:,1),x), colStart:colEnd);
 
end