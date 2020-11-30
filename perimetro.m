function [p] = perimetro(W)

n = length(W)/2 + 1;

rk = 0; 
thetak = 0;
p = 0;

for k = 1:(n-1)
    rk1 = W(k);
    thetak1 = W(n-1+k);
    
    d = sqrt(rk^2 + rk1^2 - 2*rk*rk1*cos(thetak-thetak1));
    p = p + d;
    
    rk = rk1;
    thetak = thetak1;
end

p = p + rk;

end