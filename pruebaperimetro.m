% puntos iniciales
x0 = [0.75,0.75,0];
y0 = [0,0.75,0.75];
[theta,r] = cart2pol(x0,y0);
W = [r theta]';

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
disp('------------------------------------')

%Circunferencia 
hold on
th = 0:pi/50:2*pi;
xunit = 1/2 * cos(th);
yunit = 1/2 * sin(th) + 1/2;
plot(xunit, yunit, 'c', 'Linewidth',1.5);
axis equal

% rombo original
x = [0.5 0 -0.5];
y = [0.5 1 0.5];

[theta,r] = cart2pol(x,y);
W = [r theta]';
disp('Perimetro original')
disp(-perimetro(W))
graficaPoligono(x', y', 'b--', 1)


% solucion final
n = (length(W_final)/2) + 1;
[x_final, y_final] = pol2cart(W_final(n:2*(n-1)), W_final(1:n-1));
graficaPoligono(x_final, y_final, 'r', 2)


% solucion final
n = (length(W_final2)/2) + 1;
[x_final, y_final] = pol2cart(W_final2(n:2*(n-1)), W_final2(1:n-1));
graficaPoligono(x_final, y_final, 'm', 2)

title('Polígono de 4 lados')
legend('Círculo unitario','Rombo original',  'Restricciones originales',  'Centrado en (0, 0.5)', 'Location', 'northeastoutside')

hold off
