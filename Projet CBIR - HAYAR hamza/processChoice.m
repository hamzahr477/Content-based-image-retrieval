function Is=processChoice(I,choice)
switch choice
    case 2
        Is=imadjust(I,stretchlim(I));
    case 3
        Is=histeq(I);
    case 4
        LAB = rgb2lab(I);
        L = LAB(:,:,1)/100;
        L=adapthisteq(L,'clipLimit',0.02,'Distribution','rayleigh');
        LAB(:,:,1) = L*100;
        Is = uint8(double(lab2rgb(LAB))*255);
    otherwise
        Is=I;
end