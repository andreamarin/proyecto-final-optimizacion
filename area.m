function [a] = area(W)

n = length(W)/2 + 1;

rk = 0; 
thetak = 0;
a = 0;

for k = 1:(n-1)
    rk1 = W(k);
    thetak1 = W(n-1+k);
    
    a = a + rk*rk1*sin(thetak1 - thetak);
    
    rk = rk1;
    thetak = thetak1;
end

a = -(1/2)*a;

end