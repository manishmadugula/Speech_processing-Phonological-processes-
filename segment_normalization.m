function [ matrix ] = segment_normalization( matrix_pitch )
%divide the pitch profile into segments and if segment is not zero segment 
%mean normalize it and add mean to it.

flag=0;
nSeg=0;
cel=cell(1);
x=1;
for i=1:length(matrix_pitch)
    if matrix_pitch(i)~=0
    if flag~=1
        cel{x}=[cel{x} matrix_pitch(i)];
        flag=0;
    else
        cel=[cel matrix_pitch(i)];
        flag=0;
        x=x+1;
    end
    else
        if flag~=1
            cel=[cel matrix_pitch(i)];
            flag=1;
            x=x+1;
        else
            cel{x}=[cel{x} matrix_pitch(i)];
            flag=1;
        end
    end
end

for i=1:x
if(cel{i}(1)~=0)
    arr=[]
    for j=1:length(cel{i})
    arr=[arr cel{i}(j)]
    end
mn=mean(arr);
st=std(arr);
cel{i}=(cel{i}-mn)/st;
cel{i}=cel{i}+mn;
end
end

matrix=[]
for i=1:x
matrix=[matrix cel{i}];
end
end

