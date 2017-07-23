clear all;
clc
x = imread('/home/anupam/Desktop/IVPPROJECT/Wavelet/image.jpg');

display('Wavelet transforming of image')
[xar,xhr,xvr,xdr] = dwt2(x(:,:,1),'db2');
[xag,xhg,xvg,xdg] = dwt2(x(:,:,2),'db2');
[xab,xhb,xvb,xdb] = dwt2(x(:,:,3),'db2');

xa(:,:,1) = xar; xa(:,:,2) = xag; xa(:,:,3) = xab;
xh(:,:,1) = xhr; xh(:,:,2) = xhg; xh(:,:,3) = xhb;
xv(:,:,1) = xvr; xv(:,:,2) = xvg; xv(:,:,3) = xvb;
xd(:,:,1) = xdr; xd(:,:,2) = xdg; xd(:,:,3) = xdb;
X1 = [xa*0.03 log10(xv)*0.3;log10(xh)*0.3 log10(xd)*0.3];
%figure,imshow(X1);

[xaar,xhhr,xvvr,xddr] = dwt2(xa(:,:,1),'db2');
[xaag,xhhg,xvvg,xddg] = dwt2(xa(:,:,2),'db2');
[xaab,xhhb,xvvb,xddb] = dwt2(xa(:,:,3),'db2');
xaa(:,:,1) = xaar; xaa(:,:,2) = xaag; xaa(:,:,3) = xaab;
xhh(:,:,1) = xhhr; xhh(:,:,2) = xhhg; xhh(:,:,3) = xhhb;
xvv(:,:,1) = xvvr; xvv(:,:,2) = xvvg; xvv(:,:,3) = xvvb;
xdd(:,:,1) = xddr; xdd(:,:,2) = xddg; xdd(:,:,3) = xddb;

X11 = [xaa*0.03 log10(xvv)*0.3;log10(xhh)*0.3 log10(xdd)*0.3];
%figure,imshow(X11);
display('Uncompressing image from compressed data')
decompressr = idwt2(xaar,xhhr,xvvr,xddr,'db2',size(xar));
decompressg = idwt2(xaag,xhhg,xvvg,xddg,'db2',size(xag));
decompressb = idwt2(xaab,xhhb,xvvb,xddb,'db2',size(xab));
decomp(:,:,1) = decompressr; decomp(:,:,2) = decompressg; decomp(:,:,3) = decompressb;

ddcompr = idwt2(decompressr,xhr,xvr,xdr,'db2',size(x(:,:,1)));
ddcompg = idwt2(decompressg,xhg,xvg,xdg,'db2',size(x(:,:,1)));
ddcompb = idwt2(decompressb,xhb,xvb,xdb,'db2',size(x(:,:,1)));
ddecomp(:,:,1) = ddcompr; ddecomp(:,:,2) = ddcompg; ddecomp(:,:,3) = ddcompb;
ddecomp = uint8(ddecomp);
subplot(2,2,1),imshow(x),title('Original Image');
subplot(2,2,2),imshow(xaa),title('Compressed Image');
subplot(2,2,3),imshow(ddecomp),title('Decompressed Image');
transformed = uint8(xaa);
whos x transformed ddecomp
