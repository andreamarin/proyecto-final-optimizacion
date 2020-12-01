% Optimización Numérica
% ITAM
% Proyecto final
% Andrea Marín Alarcón (158999), Andrea Pérez Vega (154467) 
% y Luis Felipe Landa Elizarralde (158228)

% poligono 4 lados
x0 = [0.75, 0.75, 0];
y0 = [0, 0.75, 0.75];
figure(1)
graficaResultado(x0,y0, 'Polígono 4 lados')

% poligono convexo
x0 = [2,2,0,-2,-2];
y0 = [1,3,6,3,1];
figure(2)
graficaResultado(x0,y0, 'Polígono convexo')

% poligono concavo
x0 = [2,2,0,-2,-2];
y0 = [1,3,2,3,1];
figure(3)
graficaResultado(x0,y0, 'Polígono concavo')