function ca = get_ca(N,c)
%   N��the number of nodes
%   c��the proportion of agents with ingratiation
ca = zeros(N,1);
x = randperm(N,round(N*c));
for i = 1:size(x,2)
    ca(x(i)) = 1;
end
