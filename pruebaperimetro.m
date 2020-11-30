 x = [2,2,0,-2,-2];
 y = [1,3,6,3,1];
 
 [theta,r] = cart2pol(x,y);
 
 W = [r theta];
 
 p = perimetro(W)
 
 
 W1 = transf(x,y);
 
 p1 = perimetro(W1)