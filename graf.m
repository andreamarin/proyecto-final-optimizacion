

 x = [0.5,0,-0.5];
 y = [0.5,1,0.5];
 
[theta,r] = cart2pol(x,y);
 
 W = [r theta];
 
 g = rest(W);

%Circunferencia 
hold on
th = 0:pi/50:2*pi;
xunit = 1/2 * cos(th);
yunit = 1/2 * sin(th) + 1/2;
plot(xunit, yunit, 'c', 'Linewidth',1.5);
axis equal

rk = 0; 
thetak = 0;

n = length(W)/2 + 1;

for k = 1:(n-1)
    rk1 = W(k);
    thetak1 = W(n-1+k);
    
    x = [rk * cos(thetak), rk1*cos(thetak1)];
    y = [rk * sin(thetak), rk1*sin(thetak1)];
    
    plot(x,y,'b', 'Linewidth',1.5)
    
    rk = rk1;
    thetak = thetak1;
end

x = [0,rk1*cos(thetak1)];
y = [0,rk1*sin(thetak1)];
plot(x,y,'b', 'Linewidth',1.5)
title('Gráfica 1')
legend({'Círculo unitario','Rombo original'},'Location','southwest')

hold off
