function [ matrix ] = cdf_normalization( matrix_1,matrix_2,Tw,Ts )
%matrix_1->reference
%matrix_2->test
Frame_Size = Tw/1000;
Frame_Shift = Ts/1000;


    
   ref = matrix_1;
   mean_ref = mean(ref);
   std_ref = std(ref);
   %ref = sort(ref);
   
   test=matrix_2;
   mean_test=mean(test);
   std_test=std(test);
   %test=sort(test);
   
   cdf_ref = cdf('Normal',ref,mean_ref,std_ref);

   cdf_test = cdf('Normal',test,mean_test,std_test);
   
   inv_cdf_test = icdf('Normal',cdf_test,mean_ref);
   matrix=inv_cdf_test;

end

