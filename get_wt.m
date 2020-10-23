function wt = get_wt(N,x,xxt,adj,f,e)
%   N£ºthe number of nodes
%   x£ºthe opinion sets
%   xxt£ºthe false opinion sets
%   adj£ºthe adjacency matrix
%   f£ºthe degree of self?confidence
%   e£ºthe bounded confidence

wt = zeros(N,N);
for i = 1:N
    a = 0;
    for j = 1:N
        if adj(i,j) == 1
            if sqrt(0.5*((x(i,1)-xxt(j,i,1))^2+(x(i,2)-xxt(j,i,2))^2)) < e
                a = a + 1;
            end
        end
    end
    w = (1-f)/a;
    for j = 1:N
        if adj(i,j) == 1
            if sqrt(0.5*((x(i,1)-xxt(j,i,1))^2+(x(i,2)-xxt(j,i,2))^2)) < e
                wt(i,j) = w;
            end
        end
        if i == j
            wt(i,j) = f;
        end
    end
end
          
                