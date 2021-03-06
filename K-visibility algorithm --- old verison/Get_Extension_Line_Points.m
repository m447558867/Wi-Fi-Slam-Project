%% Determine the intersection points between the critical ray and boundary, and define segamented points and vertexes
% Original segamented points marked by 1; extentioned segamented points marked by 2; vertexes marked by 0
function [pointsNew,flagPoint] = Get_Extension_Line_Points(pointX,critPoints,critValue,critLoca,points)
pointsNum = size(points,1);
pointsNew = points;
flagPoint = zeros(pointsNum,2);
% classify vertexes type
for i = 1 : size(critPoints,1)
    for j = 1 : pointsNum
        if critPoints(i,1) - points(j,1) == 0 && critPoints(i,2) - points(j,2) == 0
            flagPoint(j,1) = 1;
            flagPoint(j,2) = critValue(i);
            break;
        end
    end
end
for i = 1 : size(critPoints,1)
    for j = 1 : pointsNum-1
        [interPoint,flag] = Get_Intersection_Point(pointX,critPoints(i,:),points(j,:),points(j+1,:));
        if flag == 1  
            % determine vj-1 based on the critLoca
            if critLoca(i) - 1 == 0
                pointVi_1 = points(pointsNum,:);
            else
                pointVi_1 = points(critLoca(i)-1,:);
            end
            tmp = Get_Direct_Point_Line(pointX,critPoints(i,:),points(j,:))*Get_Direct_Point_Line(pointX,critPoints(i,:),pointVi_1);
            if tmp > 0
                InSectValueTmp = -2;
            else
                InSectValueTmp = 2;
            end
            [pointsNew,flagPoint] = Insert_Point(pointsNew,flagPoint,points(j,:),points(j+1,:),interPoint,InSectValueTmp);
        end
    end
end
end

% newLen = size(pointsNew,1);
% flagPoint = zeros(newLen,1);
% for i = 1 : newLen
    

