array1_1 = csvread('C:\Users\User\Dropbox\2018_Research\Papers_from_Zeeshan\MLB\Ahmed_Masri\MLB_Official_Results\Run_4\DlRsrpSinrStats.txt');
 
 for i = 0:29
   x = i;
   y = i+1;
 dataTmp = array1_1(le(array1_1(:,1),y), 1:6);
 data = dataTmp(ge(dataTmp(:,1),x), 1:6);
 filename =sprintf('DlRsrpSinrStats%d.csv', i)
 csvwrite(filename,data);
 end



 


