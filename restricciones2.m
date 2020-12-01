% Optimización Numérica
% ITAM
% Proyecto Final
% Andrea Marín Alarcón (158999), Andrea Pérez Vega (154467) 
% y Luis Felipe Landa Elizarralde (158228)

function [g] = restricciones2(W)
% Restricciones para nuestro problema de minimizacion

% In:
% W - vector con (n-1) puntos en coordenadas polares

% Out:
% g - el valor de las restricciones en W

n = length(W)/2 + 1;
k = 1;
g = zeros(5*(n-1)+ n*(n-1)/2 + (n-1),1);

% Restriccion para que esté dentro del círculo
% r_i^2 + r_j^2 - 2*r_i*r_j*cos(theta_j - theta_i) <= 1/2

rj = 1/2;
thetaj = pi/2;
for i = 1:(n-1)
    ri = W(i);
    thetai = W(n-1+i);
    g(k) = 1/2 - sqrt(ri^2 + rj^2 - 2*ri*rj*cos(thetai-thetaj));
    k = k + 1;
end

% Restricción para tener el diámetro es menor o igual a 1
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


% Ángulos deben incrementarse conforme crece la i
% theta_i+1 >= theta_i

for i = 1:(n-2)
    thetai = W(n-1+i);
    thetai1 = W(n+i);
    
    g(k) = thetai1 - thetai;
    k = k+1;
end

% Ángulo menor o igual a pi
% theta_i <= pi

for i = 1:(n-1)
    thetai = W(n-1+i);
    g(k) = pi - thetai;
    k = k+1;
end

% Ángulo mayor o igual a cero
% theta_i >= 0

for i = 1:(n-1)
    thetai = W(n-1+i);
    
    g(k) = thetai;
    k = k+1;
end

% Radio menor o igual a 1
% r_i <= 1

for i = 1:(n-1)
    ri = W(i);
    
    g(k) = 1 - ri;
    k = k+1;
end

% Radio mayor o igual a cero
% r_i >= 0

for i = 1:(n-1)
    ri = W(i);
    
    g(k) = ri;
    k = k+1;
end

end


