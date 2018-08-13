function HistoSINR = getCount(List)
% Define bins
     tmp0 = List( List(:,6) < 0, 6);
     tmp1 = List((List(:,6) >= 0)  & (List(:,6) <= 5), 6);   
     tmp2 = List((List(:,6) >= 6)  & (List(:,6) <= 10),6);
     tmp3 = List((List(:,6) >= 11)  & (List(:,6) <= 15),6);
     tmp4 = List((List(:,6) >= 11)  & (List(:,6) <= 20),6);
     tmp5 = List((List(:,6) >= 21)  & (List(:,6) <= 25),6);
     tmp6 = List((List(:,6) >= 26)  & (List(:,6) <= 30),6);
     tmp7 = List((List(:,6) >= 31)  & (List(:,6) <= 35),6);
     tmp8 = List((List(:,6) >= 36)  & (List(:,6) <= 40),6);
     tmp9 = List((List(:,6) >= 41)  & (List(:,6) <= 45),6);
     tmp10 = List((List(:,6) >= 46),6);
     
% Get Size of each bin
     size0 =  size(tmp0);
     size1 =  size(tmp1);
     size2 =  size(tmp2);
     size3 =  size(tmp3);
     size4 =  size(tmp4);
     size5 =  size(tmp5);
     size6 =  size(tmp6);
     size7 =  size(tmp7);
     size8 =  size(tmp8);
     size9 =  size(tmp9);
     size10 =  size(tmp10);

     HistoSINR = [size0(1) size1(1) size2(1) size3(1) size4(1) size5(1) size6(1) size7(1) size8(1) size9(1) size10(1)]';
end