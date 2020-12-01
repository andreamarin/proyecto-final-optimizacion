% Optimización Numérica
% ITAM
% Proyecto Final
% Andrea Marín Alarcón (158999), Andrea Pérez Vega (154467) 
% y Luis Felipe Landa Elizarralde (158228)


function [] = graficaResultado(x0, y0, graphTitle)

% Gráfica y resultado final para un (x0,y0)

% In:
% x0 - coordenadas iniciales eje x
% y0 - coordenadas iniciales eje y

% Out:
% Gráfica y resultados relevantes para un (x0,y0).

disp(graphTitle)

% Cambio a coordenadas polares

[theta,r] = cart2pol(x0,y0);
W = [r theta]';

% Gráficas y resultados relevantes

hold on
graficaPoligono(x0', y0', 'g', 1)

% Puntos interiores con restricciones originales

[W_final, fx, iter, normFk] = puntosInteriores('perimetro','restricciones', W);
disp('RESTRICCIONES ORIGINALES')
disp('Perímetro final: ')
disp(-fx)
disp('Número de iteraciones:')
disp(iter)
disp('Condiciones necesarias de primer orden:')
disp(normFk)
disp('------------------------------------')


% Puntos interiores con restricciones modificadas

[W_final2, fx, iter] = puntosInteriores('perimetro','restricciones2', W);
disp('CENTRADO EN (0, 0.5)')
disp('Perímetro final: ')
disp(-fx)
disp('Número de iteraciones:')
disp(iter)
disp('Condiciones necesarias de primer orden:')
disp(normFk)

%Circunferencia 
hold on
th = 0:pi/50:2*pi;
xunit = 1/2 * cos(th);
yunit = 1/2 * sin(th) + 1/2;
plot(xunit, yunit, 'c', 'Linewidth',1.5);
axis equal


% Rombo optimo

if strcmp(graphTitle, 'Polígono 4 lados')
    x = [0.5 0 -0.5];
    y = [0.5 1 0.5];

    [theta,r] = cart2pol(x,y);
    W = [r theta]';
    disp('------------------------------------')
    disp('Perimetro original')
    disp(-perimetro(W))
    disp('==================================================')
    graficaPoligono(x', y', 'b--', 1)
else
    disp('==================================================')
end


% Solucion final restricciones originales
n = (length(W_final)/2) + 1;
[x_final, y_final] = pol2cart(W_final(n:2*(n-1)), W_final(1:n-1));
graficaPoligono(x_final, y_final, 'r', 2)


% Solucion final restricciones modificadas
n = (length(W_final2)/2) + 1;
[x_final, y_final] = pol2cart(W_final2(n:2*(n-1)), W_final2(1:n-1));
graficaPoligono(x_final, y_final, 'm', 2)

title(graphTitle)

if strcmp(graphTitle, 'Polígono 4 lados')
    legend('Polígono inicial', 'Círculo unitario','Polígono óptimo',  'Restricciones originales',  'Centrado en (0, 0.5)', 'Location', 'northeastoutside')
else
    legend('Polígono inicial', 'Círculo unitario', 'Restricciones originales',  'Centrado en (0, 0.5)', 'Location', 'northeastoutside')
end

hold off

end