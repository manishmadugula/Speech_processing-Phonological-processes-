function [ResFrm]=ResFilter_v2(PrevSpFrm,SpFrm,FrmLPC,LPorder,FrmSize,plotflag)

ResFrm=zeros(1,FrmSize);

tempfrm=zeros(1,FrmSize+LPorder);

tempfrm(1:LPorder)=PrevSpFrm;

tempfrm(LPorder+1:LPorder+FrmSize)=SpFrm(1:FrmSize);



for(i=1:FrmSize)

	t=0;

    for(j=1:LPorder)
        
           t=t+FrmLPC(j+1)*tempfrm(-j+i+LPorder);
           
	end
	
    ResFrm(i)=SpFrm(i)-(-t);

end



if(plotflag==1)

	subplot(2,1,1);plot(SpFrm);grid;

	subplot(2,1,2);plot(ResFrm);grid;

end


%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
function [y]=preemphasis(x,a)

b=[1 -a];
a=[1];

y=filter(b,a,x);


%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

