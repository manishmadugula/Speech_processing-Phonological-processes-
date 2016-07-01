function [v1,v2]=duration_normalization_2(y1,y2)
    z1=length(y1);
    z2=length(y2);
if (length(y1)~=length(y2))
    
   
    x=round(abs((min(z1,z2)/(z2-z1))));
    
    if (length(y1)>length(y2))
        
        w=y1;
        
    else
        
        w=y2;
        
    end
    for i=1:length(w)
    if(w(:,i)==0)
        w(:,i)=-1 ;
     end
    end
    
    for i=(1:(x+1):length(w))
        
        if(w(:,i)~=0)
            w(:,i)=0;
        end
    end
    u=[];
    
    for i=1:length(w)
        
        if(w(:,i)~=0)
            if(w(:,i)==-1)
            w(:,i)=0
            end
            u=[u w(:,i)];
        end
    end
    v1=y1;
    v2=y2;
    
    if (length(y1)>length(y2))
        
        v1=u;
        
    else
        
        v2=u;
        
    end
    
end
end



