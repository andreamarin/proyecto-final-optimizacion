% Optimización Numérica
% ITAM
% Proyecto Final
% Andrea Marín Alarcón (158999), Andrea Pérez Vega (154467) 
% y Luis Felipe Landa Elizarralde (158228)

function [] = graficaPoligono(x, y, color, lw)

% Construccion de poligono.

% In:
% x - coordenadas eje x
% y - coordenadas eje y
% color - color del polígono
% lw - grosor de las líneas

% Out:
% Grafica del poligono.

xx = [0; x; 0];
yy = [0; y; 0];

plot(xx, yy, color, 'Linewidth', lw)

end