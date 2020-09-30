function [x, y] = make_circle(cx, cy, rad)
    thetha = 0:0.1:2*pi;
    x = rad .* sin(thetha) + cx;
    y = rad .* cos(thetha) +cy;