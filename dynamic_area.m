function [ region1,region2  ] = dynamic_area( path )
    X=path;
    X(:,2)=[];
    Y=path;
    Y(:,1)=[];
    seg_length=floor(max(X)/3);
    area_vector=[];
    celx=[ ];
    cely=[ ];
    for i=1:(max(X)-seg_length)
    X_Vec=[];
    Y_Vec=[];
    for j=1:length(X)
        if(X(j)>=i&&X(j)<=(i+seg_length))
        X_Vec=[X_Vec X(j)];
        Y_Vec=[Y_Vec Y(j)];
         celx=[celx X(j)];
        cely=[cely Y(j)];
        end
       
    end
    area_vector(i)=abs(trapz(X_Vec,Y_Vec)-trapz(X_Vec,X_Vec));
    end

    maxi=max(area_vector);
    region1=-1;
    for i=1:length(area_vector)
     
        if(area_vector(i)==maxi);
        region1=i;
        end
    end
    
    region2=region1+seg_length;

end
