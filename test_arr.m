Y = rand(6, 25);
u = 7;

[x dd] = size(Y);

Y1 = zeros(x, dd+u);

cnt =1;
z_cnt = 1;
an_cnt = 0;

        for i = 1:dd+u
            if(z_cnt <= dd-u/2)
                Y1(:,i) = Y(:,z_cnt);
                if(cnt <= u)
                    if(mod(cnt, 2) == 0)                     
                        Y1(:,i) = Y(:,z_cnt);
                        z_cnt = z_cnt +1;          
                        cnt = cnt+1;
                    else
                        Y1(:,dd+u-(i-1)) = Y(:,dd-an_cnt);
                        Y1(:,dd+u-i) = Y(:,dd-an_cnt);                       
                        an_cnt = an_cnt+1;        
                        cnt = cnt+1;                    
                    end;
                else
                    z_cnt = z_cnt +1;
                end;
            end;
        end;