function wt1 = get_wt1(N,x,adj,f,e)
%   N£ºthe number of nodes
%   x£ºthe opinion sets
%   adj£ºthe adjacency matrix
%   f£ºthe degree of self?confidence
%   e£ºthe bounded confidence
wt1 = zeros(N,N);
for i = 1:N
    a = 0;
    for j = 1:N
        if adj(i,j) == 1
            if sqrt(0.5*((x(i,1)-x(j,1))^2+(x(i,2)-x(j,2))^2)) < e
                a = a + 1;
            end
        end
    end
    w = (1-f)/a;
    for j = 1:N
        if adj(i,j) == 1
            if sqrt(0.5*((x(i,1)-x(j,1))^2+(x(i,2)-x(j,2))^2)) < e
                wt1(i,j) = w;
            end
        end
        if i == j
            wt1(i,j) = f;
        end
    end
end