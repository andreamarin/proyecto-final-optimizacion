 x = [2,2,0,-2,-2];
 y = [1,3,6,3,1];
 
[theta,r] = cart2pol(x,y);
 
 W = [r theta];
 
 g = rest(W);