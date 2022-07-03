function loaddata(handles)
folder = uigetdir();
disp(folder);
oldFolder = cd(folder);             % change dir to dirName
imagefiles = dir('*.jpg');           % get image file names in this folder
cd(oldFolder)                        % change dir back to root folder
numberOfFiles = length(imagefiles);  % Number of files found
data.rgbColor = zeros(numberOfFiles,256);
data.hsvColor = zeros(numberOfFiles,256);
data.meanGab = zeros(numberOfFiles,480);
data.stdGab = zeros(numberOfFiles,480);
data.txtFeat = zeros(numberOfFiles,4);
data.edgFeat = zeros(numberOfFiles,150);
data.fileNames = {};
gamma = 1;
psi = 0.1;
theta = 90;
bw = 2.8;
lambda = 3.5; 
pi = 180;
NumberOfBins=256;
resolution = [540; 540];
set(handles.text13,'String',strcat('importe data : ','(',num2str(0),' / ' ,num2str(numberOfFiles), ')') );
drawnow;
for ii=1:numberOfFiles
        set(handles.text13,'String',strcat('(',num2str(ii),' / ' ,num2str(numberOfFiles), ')') );
        % get current file name, read current image
        currentfilename =  join([folder,'/',imagefiles(ii).name]);
        drawnow;
        currentimage = imread(currentfilename);
       
        % update file names row
        data.fileNames = [data.fileNames; currentfilename];

        % resizing curr image to a standard resolution
        currentimage = imresize(currentimage,[resolution(1,:) resolution(2,:)]);
        [rows, cols, numOfBands] = size(currentimage);
        if numOfBands == 1
            %cmap = colormap(gray);
            disp(numOfBands);
            currentimage = grs2rgb(currentimage);
        end 
        currentHistRgb=colorhist(currentimage,'rgb', NumberOfBins );
        currentHistHsv=colorhist(currentimage,'hsv', NumberOfBins );
        currentEdgeFeat=edgeFeat(currentimage,0.1);
        currentTxtFeat=textureFeat(currentimage);
        currentGabMean=GaborMean(currentimage, gamma, psi, theta, bw, lambda, pi);
        currentGabStd=GaborStd(currentimage, gamma, psi, theta, bw, lambda, pi);
        data.rgbColor(ii,:) = currentHistRgb;
        data.hsvColor(ii,:) = currentHistHsv;
        data.edgFeat(ii,:) = currentEdgeFeat;
        data.txtFeat(ii,:) = currentTxtFeat;
        data.meanGab(ii,:) = currentGabMean;
        data.stdGab(ii,:) = currentGabStd;
end
set(handles.text13,'String','Fini');
save('images.mat','data');
end