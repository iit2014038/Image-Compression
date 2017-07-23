function [ Reconstruction , encodearr ] = JPEGAlgorithm( image )

[paddedimage,a,b] = PadImage(image);
[blocks, tempm, tempn] = ImageSplit( paddedimage ); %tempm and tempn are size of padded image

% Find dimensions of array of 8x8 blocks
[m,n,p,q] = size(blocks);

DCTCoefficients = DCTBlocks( blocks,m,n,p,q );
size(DCTCoefficients);

ReducedDCTCoefficients = TopCoefficients( DCTCoefficients,m,n,p,q );
size(ReducedDCTCoefficients);

compressed = genzigzag(ReducedDCTCoefficients,m,n,p,q);
size(compressed);

encodearr = [];

for h = 1:p
    for j = 1:q
        block = compressed(:,:,h,j);
        block = block';
        array = (encoderle(block));
        encodearr = [ encodearr , array(1,:) ];
     end
end

encodearr;

decodearr = decoderle(encodearr);
myvec = zeros(1,64);

compressed2 = zeros(64,1,p,q);

count = 1;
for h = 1:p
    for j = 1:q
        myvec = decodearr(count:63+count);
        myvec2 = myvec';
        compressed2(:,:,h,j) = myvec2;
        count = count+64;
    end
end    

 
uncompressed = geninvzigzag(compressed2,m*n,1,p,q);


Denormalized = denormalize(uncompressed,m,n,p,q);
size(Denormalized);

LargeReconstruction = InverseDCT( Denormalized, tempm, tempn,m,n,p,q);
Reconstruction = uint8(Shrink(LargeReconstruction,a,b));

%Display image and reconstruction
subplot(1,2,1);
colormap(gray);
imagesc(image);
subplot(1,2,2);
colormap(gray);
imagesc(Reconstruction);

end