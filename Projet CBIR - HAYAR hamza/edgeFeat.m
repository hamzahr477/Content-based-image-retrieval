function H = edgeFeat(Img, Threshold)  
% Img = imread (Image);
[oldx oldy z] = size(Img);
x = oldx/4;
y = oldy/4;
if mod(x, 2) ~= 0
    x = x + 1;
end
if mod(y, 2) ~= 0
    y = y + 1;
end
Img2 = uint8(zeros([x*4 y*4 z]));
Img2(1:oldx, 1:oldy, 1:z) = Img(1:oldx, 1:oldy, 1:z);
Img = Img2;
%figure; imshow (Img);
% Create the image Intensity
Image = rgb2gray(im2double(Img));

% Initialize the edge detection masks
H = [];

 HorizontalMask = [1 1 1;0 0 0;-1 -1 -1];
 VerticalMask   = [1 0 -1;1 0 -1;1 0 -1];
 DiagonalMask   = [0 1 1;-1 0 1;-1 -1 0];
 AntiDiagMask   = [1 1 0;1 0 -1;0 -1 -1];
%NonDirectionalMask = [2, -2;-2, 2];


% Perform the filtering using the masks to create the edge images
HImage = imfilter(Image, HorizontalMask,'replicate');
VImage = imfilter(Image, VerticalMask,'replicate');
DImage = imfilter(Image, DiagonalMask,'replicate');
AImage = imfilter(Image, AntiDiagMask,'replicate');
%NImage = imfilter(Image, NonDirectionalMask,'replicate');

% Determine the size of each subimage dynamically
m = size(Image, 1)/4; % Number of rows per subimage.
n = size(Image, 2)/4; % Number of columns per subimage.
column = 1;row = 1;counter = 1; % Variable initialization

for i = 1:16 % Loop through every subimage
   if counter > 4
       column = 1;
       row = row + m;
       counter = 1;
   end
   subImgH(i).img = subim(HImage, m, n, row, column);  % Get subimage for H
   subImgV(i).img = subim(VImage, m, n, row, column);  % Get subimage for V
   subImgD(i).img = subim(DImage, m, n, row, column);  % Get subimage for D
   subImgA(i).img = subim(AImage, m, n, row, column);  % Get subimage for A
  % subImgN(i).img = subim(NImage, m, n, row, column);  % Get subimage for A
   
   column = column + n;
   counter = counter + 1;
end


try
    for i = 1:16 % All subimages
        HLocal(i,1:5) = 0;
        row = 1; column = 1;
        for j = 1:ceil(size(subImgH(i).img,1)*size(subImgH(i).img,2)/4)  % All 2x2 blocks
            if column > size(subImgH(i).img,2)
                column = 1;
                row = row + 2;
            end
            % Determine the max edge of the averages in a 2x2 area
            [M, I] = max([sum(sum(abs(subImgH(i).img(row:row+1,column:column+1))))/4 ...
                sum(sum(abs(subImgV(i).img(row:row+1,column:column+1))))/4 ...
                sum(sum(abs(subImgD(i).img(row:row+1,column:column+1))))/4 ...
                sum(sum(abs(subImgA(i).img(row:row+1,column:column+1))))/4 ...                
                Threshold]);
            %sum(sum(abs(subImgN(i).img(row:row+1,column:column+1))))/4 ...
            
            IndexedSub(i).img((row + 1)/2,(column + 1)/2) = I; %
          %  if I ~= 5
                HLocal(i,I) = HLocal(i,I) + 1;
               % IndexedSub(i).img((row + 1)/2,(column + 1)/2) = I; % Used for displaying edges
         %   end
            column = column + 2;
        end
        HLocal(i,:) = HLocal(i,:)./(ceil(size(subImgH(i).img,1)*size(subImgH(i).img,2)/4));
    end
catch
    error('Issue with subimages having odd rows and columns, block error.')
end


for i=1:16
    H = cat(2,H,HLocal(i,:));
end
% Add vertical groups
for i=1:4
    H = cat(2, H, sum(HLocal(i:4:16,:))./4);
end
% Add Horizontal Groups
for i=0:3
    H = cat(2, H, sum(HLocal(i*4+1:i*4+4,:))./4);
end
% Add neighbor groups
H = cat(2, H, sum(HLocal([1 2 5 6],:))./4);
H = cat(2, H, sum(HLocal([3 4 7 8],:))./4);
H = cat(2, H, sum(HLocal([9 10 13 14],:))./4);
H = cat(2, H, sum(HLocal([11 12 15 16],:))./4);
H = cat(2, H, sum(HLocal([6 7 10 11],:))./4);
% Add global group
H = cat(2, H, sum(HLocal(:,:))./16);
% figure; bar (H)
end




function s = subim(f, m, n, rx, cy)

s = zeros(m, n);
rowhigh = rx + m - 1;
colhigh = cy + n - 1;
xcount = 0;
for r = rx:rowhigh
    xcount = xcount + 1;
    ycount = 0;
    for c = cy:colhigh
        ycount = ycount + 1;
        s(xcount, ycount) = f(r, c);
    end
end
end