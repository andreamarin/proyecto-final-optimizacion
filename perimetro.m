% Optimización Numérica
% ITAM
% Proyecto Final
% Andrea Marín Alarcón (158999), Andrea Pérez Vega (154467) 
% y Luis Felipe Landa Elizarralde (158228)

function [p] = perimetro(W)

% Calcula el perimetro de un polígono.

% In:
% W - vector con (n-1) puntos en coordenadas polares

% Out:
% p - perimetro del poligono

n = length(W)/2 + 1;

rk = 0; 
thetak = 0;
p = 0;

for k = 1:(n-1)
    rk1 = W(k);
    thetak1 = W(n-1+k);
    
    % Distancia entre puntos
    d = sqrt(rk^2 + rk1^2 - 2*rk*rk1*cos(thetak-thetak1));
    p = p + d;
    
    rk = rk1;
    thetak = thetak1;
end

p = p + rk;

% Necesitamos el negativo porque buscamos maximizar el perimetro, i.e., minimizar su negativo. 
p = -p;

end