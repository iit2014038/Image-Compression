clc
clear

I=imread('/home/anupam/Desktop/IVPPROJECT/RLE/image.jpg');

tempA = I;

%get thresold level
level=graythresh(I);

%convert image to binary image
display('Converting image into Binary image')
bw=im2bw(I,level);

a=bw';a=a(:);temB = a; a=a';
a=double(a);

%Encode image
display('Encoding')
encode=pptRLE(a);
%decode image
display('Decoding')
decode=pptDECODRLE(encode);
dec = decode';
[p q] = size(bw');
c = 0;
deco = zeros(p,q);
for l=1:q
    for k=1:p
        temp = c*p+k;
        deco(k,l) = dec(temp);
    end
    c = c+1;
end
deco = deco';
isequal(deco,bw)
display('Display orignal,Binary image of original image and binary image of uncompressed Image')
subplot(3,1,1),imshow(tempA),title('Original Image');
subplot(3,1,2),imshow(bw),title('Binary Image of Original Image');
subplot(3,1,3),imshow(deco),title('Binary Image after Decompress ');
decompressed = logical(deco);
encode = logical(encode);
whos bw encode decompressed
