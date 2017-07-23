 %DECOMPRESSION
clear all
clc

A = imread('/home/anupam/Downloads/Bitplane/lena.jpg');
A = rgb2gray(A);
[M,N] = size(A);
bitnums = [6;7;8];

rem = mod(M*N,8);

if(rem~=0)
rem = 8-rem;
end
    
fp = fopen('compressed_data678.data','rb');
compressedbitv = fread(fp,[length(bitnums),Inf],'uint8')';
fclose(fp);

Image = zeros([M N]);
for inc = 1:length(bitnums)

Ind = bitnums(inc);

decompressedbitv = dec2bin(compressedbitv(:,inc),8);

dbitv = decompressedbitv;
dbitv = dbitv(:);
dbitv = dbitv(1:end-rem);
dbitv = reshape(dbitv,M,N);

slicev = zeros([M N]);
ind_bitv = find(dbitv == '1');
slicev(ind_bitv) = 1;
     Image = bitset(Image,Ind,slicev);

end

Image = uint8(Image);
figure,imagesc(Image);colormap(gray);
compressedbitv = uint8(compressedbitv);
decompressedbitv = uint8(decompressedbitv);
display('decompressedbitv includes padding therefore slightly higher size ');
whos A compressedbitv decompressedbitv Image