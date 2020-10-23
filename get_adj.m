function adj = get_adj(N,p)
%   N:the number of nodes
%   p:connection probability
adj = zeros(N,N);  
for m=1:N
    for n=m+1:N
        if(rand(1,1)<p)  
            adj(m,n)=1;  
            adj(n,m)=1;  
        end
    end
end



 
