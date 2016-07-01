function [y1,y2]=duration_normalization(y1,y2)
if (length(y1)~=length(y2))
    
    z1=length(y1);
    z2=length(y2);
    x=round(abs((min(z1,z2)/(z2-z1))));
    
    if (length(y1)>length(y2))
        
        w=y1;
        
    else
        
        w=y2;
        
    end
    for i=1:length(w)
    if(w(i)==0)
        w(i)=-1 ;
     end
    end
    
    for i=(1:(x+1):length(w))
        
        if(w(i)~=0)
            w(i)=0;
        end
    end
    u=[];
    
    for i=1:length(w)
        
        if(w(i)~=0)
            if(w(i)==-1)
            w(i)=0;
            end
            u=[u w(i)];
        end
    end
    
    
    if (length(y1)>length(y2))
        
        y1=u.';
        
    else
        
        y2=u.';
        
    end
    
end


