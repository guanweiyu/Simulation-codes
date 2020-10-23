function nx = update_op(N,xxt,ut,wt,f)
%   N:the number of nodes
%   x£ºthe opinion sets
%   xxt£ºthe false opinion sets
%   ut£ºagents with uncertainty tolerances
%   wt£ºthe weight sets
%   f£ºthe degree of self?confidence
nx = zeros(N,2);
for i = 1:N
    a = 0;
    if ut(i) == 1
        for j = 1:N
            if wt(i,j) == 0
                a = a + 1;
            else
                nx(i,1) = nx(i,1) + wt(i,j) * xxt(j,i,1);
                nx(i,2) = nx(i,2) + wt(i,j) * xxt(j,i,2);
            end
        end
        if a == N-1
            nx(i,1) = nx(i,1)/f;
            nx(i,2) = nx(i,2)/f;
        end
    else
        for j = 1:N
            if wt(i,j) == 0
                a = a + 1;
            else
                t = rand(1,1);
                if t < 0.5
                    nx(i,1) = nx(i,1) + wt(i,j) * xxt(j,i,1);
                    nx(i,2) = nx(i,2) + wt(i,j) * xxt(j,i,1);
                else
                    nx(i,1) = nx(i,1) + wt(i,j) * xxt(j,i,2);
                    nx(i,2) = nx(i,2) + wt(i,j) * xxt(j,i,2);
                end
            end
        end
        if a == N-1
            nx(i,1) = nx(i,1)/f;
            nx(i,2) = nx(i,2)/f;
        end
    end
end