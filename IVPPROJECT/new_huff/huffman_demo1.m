clear all;
close all;
clc;

a=imread('/home/anupam/Desktop/IVPPROJECT/new_huff/image.jpeg');

I=rgb2gray(a);
%data = uint8(data);
[m n] = size(I);
data = I(:);
data = uint8(data);

% compress data
fprintf('Compresing data ... ')
[encoded,info] = norm2huff(data);
fprintf('Done!\n')

% decompress data
fprintf('Decompressing data ... ')
decoded = huff2norm(encoded,info);
fprintf('Done!\n')

% test it
%isOK = isequal(data(:),decoded(:))
decompress = decoded';
decompim = zeros(m,n);
count = 0;
for j=1:n
    for i=1:m
        decompim(i,j) = decompress(count+i,1);
    end
    count = count+m;
end

finaluncomp = uint8(decompim);
whos I encoded decoded finaluncomp
subplot(3,1,1),imshow(I),title('Original Image');
subplot(3,1,2),imshow(finaluncomp),title('Uncompressed Image');