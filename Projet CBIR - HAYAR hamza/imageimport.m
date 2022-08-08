function I=imageimport()
resolution = [540; 540];
% query input image from user 
[image, path] = uigetfile({'*.*';'*.bmp';'*.jpg';'*.gif'}, 'Choisissez une image');
queryimg = imread([path,image]);
queryimg = imresize(queryimg,[resolution(1,:) resolution(2,:)]); % resize query image
I=queryimg;
end