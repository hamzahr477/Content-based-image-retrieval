function im1=seuillage(i,min,max)
ig=rgb2gray(i);
tmp=(ig>=min & ig<=max).*double(i);
im1=uint8(tmp);
end