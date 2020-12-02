% Optimizacion Numerica
% ITAM
% Proyecto final
% Andrea Marin Alarcon (158999), Andrea Perez Vega (154467) 
% y Luis Felipe Landa Elizarralde (158228)

% Graficas y resultados finales para distintos (x0,y0).

% deshabilitar warnings
warning('off','all');

options = optimset('Display','off',...
    'Algorithm','interior-point');

% Poligono 4 lados
x0 = [0.75, 0.75, 0];
y0 = [0, 0.75, 0.75];
figure(1)
graficaResultado(x0,y0, 'Polígono 4 lados')

% Poligono convexo
x0 = [2,2,0,-2,-2];
y0 = [1,3,6,3,1];
figure(2)
graficaResultado(x0,y0, 'Polígono convexo')

% Poligono concavo
x0 = [2,2,0,-2,-2];
y0 = [1,3,2,3,1];
figure(3)
graficaResultado(x0,y0, 'Polígono concavo')

% polígono de 8 lados
n = 8;
theta  = linspace(0,pi,n-1);
r = ones(1, n-1).*0.2;
[x0, y0] = pol2cart(theta, r);
figure(4)
graficaResultado(x0, y0, 'Polígono de 8 lados')

