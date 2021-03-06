%% check critical vertex，and get responding value
function [critPoints,critValue,critLoca] = Get_Critical_Points(points,pointX)
pointNum = size(points,1);
critPoints = zeros(1,2);
critValue = zeros(1);
critLoca  = zeros(1);
count = 1;
for i = 1 : pointNum
    if i == 1
        pointLow = points(pointNum,:);
    else
        pointLow = points(i-1,:);
    end
    if i == pointNum
        pointUp = points(1,:);
    else
        pointUp = points(i+1,:);
    end
    tmpLow = Get_Direct_Point_Line(pointX,points(i,:),pointLow);
    tmpUp = Get_Direct_Point_Line(pointX,points(i,:),pointUp);
    if tmpLow * tmpUp > 0
        critPoints(count,:) = points(i,:);
        critLoca(count) = i;
        if  pointUp(2) > pointLow(2)
            critValue(count) = 1;
        else 
            critValue(count) = -1;
        end
        count = count + 1;
    else
        continue;
    end
end