function [] = graficaResultado(x0, y0, graphTitle)

disp(graphTitle)

[theta,r] = cart2pol(x0,y0);
W = [r theta]';

hold on
graficaPoligono(x0', y0', 'g', 1)

[W_final, fx, iter, normFk] = puntosInteriores('perimetro','restricciones', W);
disp('RESTRICCIONES ORIGINALES')
disp('Perímetro final: ')
disp(-fx)
disp('Número de iteraciones:')
disp(iter)
disp('Condiciones necesarias de primer orden:')
disp(normFk)
disp('------------------------------------')

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


if strcmp(graphTitle, 'Polígono 4 lados')
    % rombo original
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


% solucion final restricciones originales
n = (length(W_final)/2) + 1;
[x_final, y_final] = pol2cart(W_final(n:2*(n-1)), W_final(1:n-1));
graficaPoligono(x_final, y_final, 'r', 2)


% solucion final restricciones 2
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