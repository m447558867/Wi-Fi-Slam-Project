function [pointsNew,flagPoint] = Insert_Point(points,flagPoint,pointA,pointB,pointInsert,InSectValueTmp)
tmpA = 0;
tmpB = 0;
for i = 1 : length(points)
    if points(i,1) - pointA(1) == 0 && points(i,2) - pointA(2) == 0
        tmpA = i;
    elseif points(i,1) - pointB(1) == 0 && points(i,2) - pointB(2) == 0
        tmpB = i;
        break;
    end
end
% Determine whethe there is a new point between the point A and point B; If so, copy the information of the new point
pointsTmp = zeros(1,2);
count = 1;
disInsert = sqrt((pointInsert(1)-pointA(1))^2+(pointInsert(2)-pointA(2))^2);
insertLoca = tmpA + 1;
if tmpB - tmpA ~= 1
    for i = tmpA+1:tmpB-1
        pointsTmp(count,:) = points(i,:);
        count = count + 1;
    end
    % Determine distance between the points include the new point and X
    flag = 0;
    for i = 1 : count-1
        disTmp = sqrt((pointsTmp(i,1)-pointA(1))^2+(pointsTmp(i,2)-pointA(2))^2);
        if disTmp > disInsert
            flag = 1;
            insertLoca = tmpA + i;
            break;
        end
    end
    if flag == 0
       insertLoca = tmpA + count;
    end
end
pointsNew = [points(1:insertLoca-1,:);pointInsert;points(insertLoca:end,:)];
flagPoint = [flagPoint(1:insertLoca-1,:);[2,InSectValueTmp];flagPoint(insertLoca:end,:)];