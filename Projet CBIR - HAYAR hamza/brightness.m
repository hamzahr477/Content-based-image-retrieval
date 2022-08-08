function Is=brightness(I,level)
I=double(I);
Is=uint8(I+level);
end