clear;clc;close all;
%% Inputs
% vertexes numeber:pointNum
% coordinate of vertexes
% coordinate of x location
% pointNum = input('numbers of vertexes：');
% points = zeros(N,2);
% for i = 1 : pointNum
%     sprintf('Please type i %d vertexes coordinate[x,y]',i)
%     points(i,:) = input('');
% %     points(i,2) = input('i%d y coordinate：',i);
% end
% X = input('Enter x point coordinate[x,y]：');
points = [3.5, 3;
            6, 4.6;
            3.3, 6;
            7, 6.5;
            6.5, 4.4;
            9, 3;
            9.5, 6;
            4, 7.5;
            2, 7;
            0.5, 6
            0.5, 3;
            1.5, 3.2;
            1.5, 5;
            2.5, 4.8;
            2.5, 3;
            1, 0.5;
            3.5, 0.4];
pointNum = size(points,1); 
pointX = [3, 1.5];
%% Get critical vertex
[critPoints,critValue,critLoca] = Get_Critical_Points(points,pointX);
%% Get the intersection pionts values by the critical externsion ray
[pointsNew,flagPoint]= Get_Extension_Line_Points(pointX,critPoints,critValue,critLoca,points);
%% Get Start point
startFlag = 0;
startPoint = zeros(1,2);
for i = 1 : length(pointsNew)
    if i == length(pointsNew)
        [interPoint,flag] = Get_Intersection_Point(pointX,[pointX(1)+0.1, pointX(2)],pointsNew(i,:),pointsNew(1,:));
    else
        [interPoint,flag] = Get_Intersection_Point(pointX,[pointX(1)+0.1, pointX(2)],pointsNew(i,:),pointsNew(i+1,:));
    end
    if flag == 1
        startPoint = interPoint;
        break;
    end
end
%% Calculate result
pointsNew2 = [startPoint;pointsNew];
pointsResult = zeros(size(pointsNew2,1),5);
pointsResult(1,:) = [0, pointsNew2(1,:),pointsNew2(2,:)];
for i = 2 : size(pointsNew2,1)
    if i == size(pointsNew2,1)
        if flagPoint(i-1,1) == 0
            pointsResult(i,:) = [pointsResult(i-1,1),pointsNew2(i,:),pointsNew2(1,:)];
        else
            tmpResult = pointsResult(i-1,1) + flagPoint(i-1,2);
            pointsResult(i,:) = [tmpResult,pointsNew2(i,:),pointsNew2(1,:)];
        end
    else
        if flagPoint(i-1,1) == 0
            pointsResult(i,:) = [pointsResult(i-1,1),pointsNew2(i,:),pointsNew2(i+1,:)];
        else
            tmpResult = pointsResult(i-1,1) + flagPoint(i-1,2);
            pointsResult(i,:) = [tmpResult,pointsNew2(i,:),pointsNew2(i+1,:)];
        end
    end
end
%% Display
rectWide = 8;
rectLen = 10;
rectPos = [0 0;0 rectWide;rectLen rectWide; rectLen 0];
ax = axes('Parent', figure);
hold(ax,'on')
% Draw a rectangular frame
for i = 1 : length(rectPos)-1
    plot(ax,[rectPos(i,1), rectPos(i+1,1)],[rectPos(i,2) rectPos(i+1,2)],'black');
end
plot(ax,[rectPos(4,1), rectPos(1,1)],[rectPos(4,2) rectPos(1,2)],'black');
% Draw the graph
for i = 1 : pointNum-1
    plot(ax,[points(i,1), points(i+1,1)],[points(i,2) points(i+1,2)],'black');
end
plot(ax,[points(pointNum,1), points(1,1)],[points(pointNum,2) points(1,2)],'black');
% Mark X point
plot(ax,pointX(1),pointX(2),'o','MarkerSize',8,'MarkerFaceColor','black');
% Mark critical vertexes
for i = 1 : length(critPoints)
    if critValue(i) == 1
        plot(ax,critPoints(i,1),critPoints(i,2),'ro');
    else
        plot(ax,critPoints(i,1),critPoints(i,2),'go');
    end
end
% Marked the split point
for i = 1 : length(flagPoint)
    if flagPoint(i) == 1
         plot(ax,pointsNew(i,1),pointsNew(i,2),'r*');
    elseif flagPoint(i) == 2
        plot(ax,pointsNew(i,1),pointsNew(i,2),'g*');
    end
end
hold(ax,'off')

resultMax = max(pointsResult(:,1));
for i = 0 : resultMax
    ax1 = axes('Parent', figure);
    hold(ax1,'on')
    for h = 1 : length(rectPos)-1
        plot(ax1,[rectPos(h,1), rectPos(h+1,1)],[rectPos(h,2) rectPos(h+1,2)],'black');
    end
    for j = 0 : i
        for k = 1 : size(pointsResult,1)
           if pointsResult(k,1) == j
               plot(ax1,[pointsResult(k,2),pointsResult(k,4)],[pointsResult(k,3),pointsResult(k,5)],'b');
               text((pointsResult(k,2)+pointsResult(k,4))/2,(pointsResult(k,3)+pointsResult(k,5))/2,num2str(j));
           end
        end
    end
    titieTmp = strcat('K = ',num2str(i));
    title(ax1,titieTmp);  
end



