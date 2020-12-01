function [] = graficaPoligono(x, y, color, lw)
xx = [0; x; 0];
yy = [0; y; 0];

plot(xx, yy, color, 'Linewidth', lw)

end