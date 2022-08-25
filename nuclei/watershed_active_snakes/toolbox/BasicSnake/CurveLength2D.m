function s = CurveLength2D(x,y)
%CURVELENGTH2D Computes the length of the curve

dx = x(1:end-1) - x(2:end);
dy = y(1:end-1) - y(2:end);

s = sum(sqrt(dx.^2 + dy.^2));

end

