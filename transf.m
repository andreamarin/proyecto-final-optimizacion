function [W] = transf(x,y)

n = length(x);
W = zeros(2*n,1);

for k = 1:n
    W(k) = sqrt(x(k)^2 + y(k)^2);
    W(n + k) = atan2(y(k),x(k));
end

end