function ca = get_ca(N,c)
%   N£ºthe number of nodes
%   c£ºthe proportion of agents with ingratiation
ca = zeros(N,1);
x = randperm(N,round(N*c));
for i = 1:size(x,2)
    ca(x(i)) = 1;
end
