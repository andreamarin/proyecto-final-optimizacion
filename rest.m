function [g] = rest(W)

n = length(W)/2 + 1;
k = 1;
g = zeros(5*(n-1)+ n*(n-1)/2,1);

for i = 1:(n-1)
    ri = W(i);
    g(k) = ri^2;
    k = k+1;
end

for i = 1:(n-1)
    ri = W(i);
    thetai = W(n-1+i);
    
    for j = i:(n-1) 
     rj = W(j);
     thetaj = W(n-1+j);
    
     g(k) = ri^2 + rj^2 - 2*ri*rj*cos(thetai-thetaj) - 1;
     k = k+1;
    end
end


for i = 1:(n-2)
    thetai = W(n-1+i);
    thetai1 = W(n+i);
    
    g(k) = thetai - thetai1;
    k = k+1;
end

for i = 1:(n-1)
    thetai = W(n-1+i);
    
    g(k) = thetai - pi;
    k = k+1;
end

for i = 1:(n-1)
    thetai = W(n-1+i);
    
    g(k) = - thetai;
    k = k+1;
end

for i = 1:(n-1)
    ri = W(i);
    
    g(k) = ri -1;
    k = k+1;
end

for i = 1:(n-1)
    ri = W(i);
    
    g(k) = -ri;
    k = k+1;
end

end


