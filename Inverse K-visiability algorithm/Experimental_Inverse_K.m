original_picture = imread('C:\Users\Frankzaizai\Desktop\Capstone\test_area_1.png');
%Read RGB value respectly
image_r=original_picture(:,:,1); %1 for Red
image_g=original_picture(:,:,2); %2 for Green
image_b=original_picture(:,:,3); %3 for Blue
[row,column,dk] = size(original_picture); % determine pixel size of picture
%RGB[64;64;64] is 80% gray
%RGB[128;128;128] is 50% gray
%RGB[192;192;192] is 25% gray
%RGB[255;255;255]0. is white
%RGB[0;0;0] is black
k_1 = [192;192;192];
k_2 = [0;0;0];
k_4 = [64;64;64];
k_3 = [255;255;255];
k_0 = [128;128;128];

%%
% vertical pixel calculation
for r=1:1:row 
    for col=1:1:column
        if col ~= column
        pix_1 = [image_r(r,col);image_g(r,col);image_b(r,col)]; %define first pixel RGB from workspace
        pix_2 = [image_r(r,col+1);image_g(r,col+1);image_b(r,col+1)]; % second pixel will check next column 
        end
    if (pix_1 == k_0 & pix_2 == k_1 | pix_1 == k_1 & pix_2 == k_0) % bounary condition for k=0 & k=1 areas
        dotx=col;
        doty=-r;
        plot(dotx, doty,'.b','markersize',5);
        hold on;
    end
    if (pix_1 == k_1 & pix_2 == k_2 | pix_1 == k_2 & pix_2 == k_1) % bounary condition for k=1 & k=2 areas
        dotx=col;
        doty=-r;
        plot(dotx, doty,'.b','markersize',5);
        hold on;
    end
    if (pix_1 == k_2 & pix_2 == k_3 | pix_1 == k_3 & pix_2 == k_2) % bounary condition for k=2 & k=3 areas
        dotx=col;
        doty=-r;
        plot(dotx, doty,'.b','markersize',5);
        hold on;
    end
   if (pix_1 == k_3 & pix_2 == k_4 | pix_1 == k_4 & pix_2 == k_1) % bounary condition for k=3 & k=4 areas
        dotx=col;
        doty=-r;
        plot(dotx, doty,'.b','markersize',5);
        hold on;
    end
    if (pix_1 == k_0 & pix_2 ~= k_0 | pix_1 ~= k_0 & pix_2 == k_0)
        dotx=col;
        doty=-r;
        plot(dotx, doty,'.b','markersize',5);
        hold on;
    end
    end
end

% horizontal pixel calculation
for r=1:1:row
    for col=1:1:column
        if r ~= row
        pix_1 = [image_r(r,col);image_g(r,col);image_b(r,col)];
        pix_2 = [image_r(r+1,col);image_g(r+1,col);image_b(r+1,col)];
        end
    if (pix_1 == k_0 & pix_2 == k_1 | pix_1 == k_1 & pix_2 == k_0)
        dotx=col;
        doty=-r;
        plot(dotx, doty,'.b','markersize',5);
        hold on;
    end
    if (pix_1 == k_1 & pix_2 == k_2 | pix_1 == k_2 & pix_2 == k_1)
        dotx=col;
        doty=-r;
        plot(dotx, doty,'.b','markersize',5);
        hold on;
    end
    if (pix_1 == k_2 & pix_2 == k_3 | pix_1 == k_3 & pix_2 == k_2)
        dotx=col;
        doty=-r;
        plot(dotx, doty,'.b','markersize',5);
        hold on;
    end
    if (pix_1 == k_3 & pix_2 == k_4 | pix_1 == k_4 & pix_2 == k_1)
        dotx=col;
        doty=-r;
        plot(dotx, doty,'.b','markersize',5);
        hold on;
    end
        if (pix_1 == k_0 & pix_2 ~= k_0 | pix_1 ~= k_0 & pix_2 == k_0)
        dotx=col;
        doty=-r;
        plot(dotx, doty,'.b','markersize',5);
        hold on;
    end
    end
end
hold off;