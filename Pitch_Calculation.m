function[T0, F0, pks1] =  Pitch_Calculation(segment, Fs)
    segment1 = zeros(1,length(segment));
    %segment1 = zeors(segment1);
    len = length(segment);
    T = 1/Fs;
    
    %t1 = (iter-1)*10;
    %time = (T+t1:T:(len/Fs)+t1);
    
    [f0_time,pitch,T01, SHR,f0_candidates] = shrp(segment,Fs);
    
   if ( pitch > 50 && pitch < 1100)
       
        %pkheight = 0;
        [pks, locs] = findpeaks(segment);
        
        locs1 = locs./Fs;
%        locs1 = (locs./Fs)+t1;

            peaks(1,:) = pks;
            peaks(2,:) = locs1;

            peaks = peaks.';

            peaks = sortrows(peaks,1);

            it1 = 1;
            [r_p, c_p] = size(peaks);
            for it=r_p:-1:1
                peaks1(it1,1) = peaks(it,1);
                peaks1(it1,2) = peaks(it,2);
                it1 = it1 + 1;
            end

            peaks = peaks1.';

            pks = peaks(1,:);
            locs1 = peaks(2,:);
            %disp(pitch);
            t1 = 1/pitch;
            t1 = round(25E-3/t1);
            %disp(pks);
            %disp(length(locs1));
             it1 = 1;
             T0(1) = 0;
             pks1(1) = 0;
            if (length(locs1) >= t1)
                for it = 1:t1-1
                    T0(it1) = abs(locs1(it+1) - locs1(it));
                    pks1(it1) = pks(it);
                    it1 = it1 + 1;
                end
            else
                for it = 1:length(locs1) -1
                    if (locs1(it) >= 0)
                        T0(it1) = abs(locs1(it+1) - locs1(it));
                        pks1(it1) = pks(it);
                        it1 = it1 + 1;
                    else
                        break;
                    end
                end
            end
            if ((length(T0) > 0) && (T0(1) ~= 0))
                F0 = round(1./T0);
            else
                F0 = 0
            end
    else
        T0(1) = 0;
        pks1(1) = 0;
        F0(1) = 0;
    end   
    
end