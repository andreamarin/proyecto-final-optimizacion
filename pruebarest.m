 x = [1,0,-1];
 y = [1/2,1,1/2];
 
[theta,r] = cart2pol(x,y);
 
 W = [r theta];
 
 g = rest(W);