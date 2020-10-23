function ut = get_ut(N,r)
%   N£ºthe number of nodes
%   r£ºthe proportion of agents with uncertainty tolerances
ut = zeros(N,1);
x = randperm(N,round(N*r));
for i = 1:size(x,2)
    ut(x(i)) = 1;
end