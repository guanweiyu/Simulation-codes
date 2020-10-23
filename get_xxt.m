function xxt = get_xxt(N,x,ca,adj,q)
%   N:the number of nodes
%   x£ºthe opinion sets
%   ca:agents with ingratiation
%   adj£ºthe adjacency matrix
%   q£ºthe ingratiation degree
xxt = zeros(N,N,2);
for i = 1:N
    if x(i,1)<x(i,2)
        if ca(i) == 1
            for j = 1:N
                if adj(i,j) == 1
                    xxt(i,j,1) = x(i,1) + q*(x(j,1)-x(i,1));
                    xxt(i,j,2) = x(i,2) + q*(x(j,2)-x(i,2));
                else
                    xxt(i,j,1) = x(i,1);
                    xxt(i,j,2) = x(i,2);
                end
            end
        else
            for j = 1:N
                xxt(i,j,1) = x(i,1);
                xxt(i,j,2) = x(i,2);
            end
        end
    else
        if ca(i) == 1
            for j = 1:N
                if adj(i,j) == 1
                    a = x(j,1) - x(i,1);
                    b = x(j,2) - x(i,2);
                    t = rand(1,1);
                    if t <0.5
                        xxt(i,j,1) = x(i,1) + q*a;
                        xxt(i,j,2) = x(i,2) + q*a;
                    else
                        xxt(i,j,1) = x(i,1) + q*b;
                        xxt(i,j,2) = x(i,2) + q*b;
                    end
                else
                    xxt(i,j,1) = x(i,1);
                    xxt(i,j,2) = x(i,2);
                end
            end
        else
            for j = 1:N
                xxt(i,j,1) = x(i,1);
                xxt(i,j,2) = x(i,2);
            end
        end
    end
end
            