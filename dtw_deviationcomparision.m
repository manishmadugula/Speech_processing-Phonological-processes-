function [ segments_X,segments_Y,area_vector ] = dtw_deviationcomparision( path ,noofseg)
%returns the frame number where the deviation is maximum

X=path;
X(:,2)=[];
Y=path;
Y(:,1)=[];
seg_length=floor(max(X)/noofseg);
segments_X=cell([1 noofseg]);
segments_Y=cell([1 noofseg]);

  
        
              for j=1:noofseg
                  for i=1:size(X)
        if((X(i)>=(j-1)*seg_length)&&(X(i)<j*seg_length))
            
            segments_X{j}=[segments_X{j} X(i)];
            segments_Y{j}=[segments_Y{j} Y(i)];
        end
       
            
                  end
         if(j~=1)
           segments_X{j}=[max(segments_X{j-1}) segments_X{j} ];
           segments_Y{j}=[max(segments_Y{j-1}) segments_Y{j} ]; 
        end
              end
area_vector=zeros(1,noofseg);

for i=1:noofseg

X_Vec=segments_X{i};
Y_Vec=segments_Y{i};
if(~isempty(X_Vec))
    area_vector(i)=abs(trapz(X_Vec,Y_Vec)-trapz(X_Vec,X_Vec));
else
    area_vector(i)=0;
end

    

end
end
