N = 200;
M = 20;
T = 500;
avgv = zeros(M);
avgwu = zeros(M);
avgur = zeros(M);
avgtime = zeros(M);
parfor m = 1:M
    for n = 1:M
        v = zeros(T,1);
        wu = zeros(T,1);
        ur = zeros(T,1);
        time = zeros(T,1);
        for ci = 1:T
            c = 0.5*m/M;
            q = 0.5*n/M;
            adj = get_adj(N,0.3);
            x = get_x0(N,0.5);
            x0 = x;
            ca = get_ca(N,c);
            ut = get_ut(N,0.5);
            nx = zeros(N,2);
            t = nx-x;
            a = sum(sum(abs(t)));
            while a > 0.0001
                xxt = get_xxt(N,x,ca,adj,q);
                wt = get_wt(N,x,xxt,adj,0.5,0.1);
                nx = update_op(N,xxt,ut,wt,0.5);
                t = nx - x;
                a = sum(sum(abs(t)));
                x = nx;
                time(ci) = time(ci) + 1;
                if time(ci) == 1000
                    break
                end
            end
            if time(ci) == 1000
                continue
            end
            v(ci) = sum(sum(abs(x-x0)))/time(ci);
            wu(ci) = sum(x(:,2)-x(:,1));
            for i =1:N
                if x(i,2)-x(i,1) > 0.0001
                    ur(ci) = ur(ci) + 1;
                end
            end
            ur(ci) = ur(ci) / N;
        end
        avgv(m,n) = mean(v(v~=0));
        avgwu(m,n) = mean(wu(wu~=0));
        avgur(m,n) = mean(ur(ur~=0));
        avgtime(m,n) = round(mean(time(time~=1000)));
    end
end

