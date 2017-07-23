clear all
clc


%INPUT IMAGE
A = imread('/home/anupam/Downloads/Bitplane/lena.jpg');
A = rgb2gray(A);
%Encoding
bitnums = [6;7;8]; %BIT PLANES

%CHECK IF PADDING WITH ZEROS IS NEEDED OR NOT
rem = mod(numel(A),8);
if(rem~=0)
rem = 8-rem;
end

%EXTRACT EACH BIT AND STORE IT IN THE MATRIX
    
for inc =1:length(bitnums)

Ind = bitnums(inc);

%EXTRACT THE 'n'th BIT
bitval = bitget(A,Ind);

%PAD WITH ZEROS AND RESHAPE THE MATRIX
bval = bitval;
bval = bval(:);
bval = [bval;zeros(rem,1)];

matv = reshape(bval,[],8);
strv = num2str(matv);
strv = strv(:,1:3:end);

%CONVERT BINARY TO DECIMAL
compressedbitv(:,inc) = uint8(bin2dec(strv));

end

 %STORE THE COMPRESSED DATA IN A FILE
%OPTIONAL
fp = fopen('compressed_data678.data','wb');
fwrite(fp,compressedbitv','uint8');
fclose(fp);
whos A compressedbitv