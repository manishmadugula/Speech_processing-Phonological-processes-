function [ minimum_distance,area,matrixX,matrixY,steps ] = dtwFeatureExtraction( f1,f2,Tw )
%Calculates dtw and then extracts the following features from
%2 sequences

[minimum_distance, dist, g, path] = dtw(f1,f2,Tw);


    %plot the distance matrix
    
    X=path;
    X(:,2)=[];
    Y=path;
    Y(:,1)=[];
    plot(X,Y);
    hold on;
    plot(X,X,'r');
    hold off;

    %finding area between the 2 curves;
    area=abs(trapz(X,Y)-trapz(X,X));
    
    %finding horizontal and vertical segments of the dtw curve
    sizeX=0;
    steps=0;
    matrixX=[];
    startX=0;
    flagX=0;
    %loc_steps=[];
    for(i=1:length(X)-1)
        if((X(i+1)-X(i))==0)
            if(flagX==0)
            flagX=1;
            startX=i;
            end
            sizeX=sizeX+1;
        end
        
        if(X(i+1)-X(i)~=0)
            if(flagX==1)
                end1=i;
                 A=[sizeX,startX,end1];
                matrixX=[matrixX ; A];
                startX=0;
                sizeX=0;
                flagX=0;
                if(Y(i)==Y(i+1))
                    steps=steps+1;
                   % loc_steps=[loc_steps;i];
                end
                
            end
        end
    end


    sizeY=0;
    matrixY=[];
    startY=0;
    flagY=0;
    for(i=1:length(Y)-1)
        if((Y(i+1)-Y(i))==0)
            if(flagY==0)
            flagY=1;
            startY=i;
            end
            sizeY=sizeY+1;
        end
        
        if(Y(i+1)-Y(i)~=0)
            if(flagY==1)
                end1=i;
                 A=[sizeY,startY,end1];
                matrixY=[matrixY ; A];
                startY=0;
                sizeY=0;
                flagY=0;
                if(X(i)==X(i+1))
                    steps=steps+1;
                   % loc_steps=[loc_steps;i];
                end
                
            end
        end
    end
    
   
    
    

end

