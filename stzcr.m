function [ zc ] = stzcr( y,Fs,Tw,Ts )
Frame_size=Tw/1000;
Frame_shift=Ts/1000;
window_length=Frame_size*Fs;
window_shift=floor(Frame_shift*Fs);
sum=0;
w = window(@rectwin,window_length);
jj=1;
for i=1:(floor(length(y)/window_shift)-ceil(window_length/window_shift))       
for j=((i-1)*window_shift+2):(((i-1)*window_shift+1)+window_length)
    j=round(j);
y(j)=y(j)*w(jj);
jj=jj+1;
yy=y(j)*y(j-1);
    if(yy<0)
     sum=sum+1;
    end

end
zcr(i)=sum/(2*window_length);
sum=0;
jj=1;
end
zc=zcr;
plot(zcr);
end

