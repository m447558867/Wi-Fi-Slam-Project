%% Using cross product to determine the point is upper left or lower right
% fucntion：result = (pointTmp-pointX)X(pointV-pointX)
% if result > 0，the pointTmp is upper left on the ray
% if result < 0，the pointTmp is lower right on the ray
function result = Get_Direct_Point_Line(pointX,pointV,pointTmp)
vectBase = [pointV-pointX, 0];
vectTmp = [pointTmp-pointX, 0];
resultTmp = cross(vectTmp,vectBase);
result = resultTmp(3);
