function [g] = restricciones(W)
n = length(W)/2 + 1;
k = 1;
g = zeros(5*(n-1)+ n*(n-1)/2,1);

% restricción para tener el diámetro es menor a 1
% r_i^2 + r_j^2 - 2*r_i*r_j*cos(theta_j - theta_i) <= 1
for i = 1:(n-1)
    ri = W(i);
    g(k) = 1 - ri;
    k = k+1;
end

for i = 1:(n-1)
    ri = W(i);
    thetai = W(n-1+i);
    
    for j = i+1:(n-1) 
     rj = W(j);
     thetaj = W(n-1+j);
    
     d = sqrt(ri^2 + rj^2 - 2*ri*rj*cos(thetai-thetaj));
     g(k) = 1 - d;
     g(k+1) = d - 0.4;
     k = k+2;
    end
end


% ángulos deben incrementarse conforme crece la i
for i = 1:(n-2)
    thetai = W(n-1+i);
    thetai1 = W(n+i);
    
    g(k) = thetai1 - thetai;
    k = k+1;
end

% ángulo menor a pi
for i = 1:(n-1)
    thetai = W(n-1+i);
    g(k) = pi - thetai;
    k = k+1;
end

% ángulo mayor a cero
for i = 1:(n-1)
    thetai = W(n-1+i);
    
    g(k) = thetai;
    k = k+1;
end

% radio menor a 1
for i = 1:(n-1)
    ri = W(i);
    
    g(k) = 1 - ri;
    k = k+1;
end

% radio mayor a cero
for i = 1:(n-1)
    ri = W(i);
    
    g(k) = ri;
    k = k+1;
end

end


