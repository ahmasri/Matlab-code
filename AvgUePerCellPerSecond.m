function avgData1 = AvgUePerCellPerSecond(UesPerCellperSecond, NumEnb)
       
    for i = 1:NumEnb
            tmp = UesPerCellperSecond(i,:);
           %tmpNoNan   = RemoveNAN(tmp);
            avgNum1(i) =  mean(tmp,'omitnan');
     end
           avgData1= avgNum1';
end