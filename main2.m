N = 200;
M = 20;
T = 500;
avgv1 = zeros(M);
avgwu1 = zeros(M);
avgur1 = zeros(M);
avgtime1 = zeros(M);
parfor m = 1:M
    for n = 1:M
        v1 = zeros(T,1);
        wu1 = zeros(T,1);
        ur1 = zeros(T,1);
        time1 = zeros(T,1);
        for ci = 1:T
            c = m/M;
            q = n/M;
            adj = get_adj(N,0.3);
            x = get_x0(N,c);
            x0 = x;
            ut = get_ut(N,q);
            nx = zeros(N,2);
            t = nx-x;
            a = sum(sum(abs(t)));
            while a > 0.0001
                wt = get_wt1(N,x,adj,0.5,0.1);
                nx = update_op1(N,x,ut,wt,0.5);
                t = nx - x;
                a = sum(sum(abs(t)));
                x = nx;
                time1(ci) = time1(ci) + 1;
                if time1(ci) == 1000
                    break
                end
            end
            if time1(ci) == 1000
                continue
            end
            v1(ci) = sum(sum(abs(x-x0)))/time1(ci);
            wu1(ci) = sum(x(:,2)-x(:,1));
            for i =1:N
                if x(i,2)-x(i,1) > 0.0001
                    ur1(ci) = ur1(ci) + 1;
                end
            end
            ur1(ci) = ur1(ci) / N;
        end
        avgv1(m,n) = mean(v1(v1~=0));
        avgwu1(m,n) = mean(wu1(wu1~=0));
        avgur1(m,n) = mean(ur1(ur1~=0));
        avgtime1(m,n) = round(mean(time1(time1~=1000)));
    end
end