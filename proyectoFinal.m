% Optimizaci�n Num�rica
% ITAM
% Proyecto final
% Andrea Mar�n Alarc�n (158999), Andrea P�rez Vega (154467) 
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
graficaResultado(x0,y0, 'Pol�gono 4 lados')

% Poligono convexo
x0 = [2,2,0,-2,-2];
y0 = [1,3,6,3,1];
figure(2)
graficaResultado(x0,y0, 'Pol�gono convexo')

% Poligono concavo
x0 = [2,2,0,-2,-2];
y0 = [1,3,2,3,1];
figure(3)
graficaResultado(x0,y0, 'Pol�gono concavo')

