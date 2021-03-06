%% define and determine the intersection point bewteen the ray of（pointX，pointD）and the ray of（pointA,pointB)
function [interPoint,flag] = Get_Intersection_Point(pointX,pointD,pointA,pointB)
syms x y real
flag = 0;
interPoint = zeros(1,2);
% determine whether the critical ray intersects with the segament, if so, then calculate the coordinate
tmp1 = Get_Direct_Point_Line(pointA,pointB,pointD) * Get_Direct_Point_Line(pointA,pointB,pointX);
tmp2 = Get_Direct_Point_Line(pointB,pointX,pointD) * Get_Direct_Point_Line(pointB,pointX,pointA);
tmp3 = Get_Direct_Point_Line(pointX,pointA,pointD) * Get_Direct_Point_Line(pointX,pointA,pointB);
if tmp1 > 0 && tmp2 > 0 && tmp3 > 0
    flag = 1;
    a1 = pointA(1);
    a2 = pointA(2);
    b1 = pointB(1);
    b2 = pointB(2);
    c1 = pointX(1);
    c2 = pointX(2);
    d1 = pointD(1);
    d2 = pointD(2);
    f1 = [x-a1,y-a2]*[b1-a1,b2-a2]'-sqrt([x-a1,y-a2]*[x-a1,y-a2]')*sqrt([b1-a1,b2-a2]*[b1-a1,b2-a2]');
    f2 = [x-c1,y-c2]*[d1-c1,d2-c2]'-sqrt([x-c1,y-c2]*[x-c1,y-c2]')*sqrt([d1-c1,d2-c2]*[d1-c1,d2-c2]');
    [interPoint(1),interPoint(2)] = solve(f1,f2,x,y);
end
