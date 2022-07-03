function Is=contrast(I,level)
factor = (259 * (level + 255) ) /(255 *(259 - level));
I=double(I);
I=(I-128)*factor + 128;
Is=uint8(I);
end