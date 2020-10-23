function x = get_x0(N,s)
%   N£ºthe number of nodes
%   s£º the proportion of agents expressing uncertain opinions

x = zeros(N,2);
y = zeros(N,1);
z = randperm(N,round(N*s));
for i = 1:size(z,2)
    y(z(i)) = 1;
end
for i = 1:N
    p = rand(1);
    if y(i) == 0 
        x(i,1) = p;
        x(i,2) = p;
    else
        q = rand(1);
        x(i,1) = max(0,p-q/2);
        x(i,2) = min(1,p+q/2);
    end
end
    
