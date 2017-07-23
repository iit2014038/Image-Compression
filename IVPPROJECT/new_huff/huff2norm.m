function vector = huff2norm(zipped,info)

% ensure to handle uint8 input vector
if ~isa(zipped,'uint8'),
	error('input argument must be a uint8 vector')
end

% create the 01 sequence
len = length(zipped);
string = repmat(uint8(0),1,len.*8);
bitindex = 1:8;
for index = 1:len,
	string(bitindex+8.*(index-1)) = uint8(bitget(zipped(index),bitindex));
end
	
% adjust string
string = logical(string(:)'); % make a row of it
len = length(string);
string((len-info.pad+1):end) = []; % remove 0 padding
len = length(string);

% build output
weights = 2.^(0:51);
vector = repmat(uint8(0),1,info.length);
vectorindex = 1;
codeindex = 1;
code = 0;
for index = 1:len,
	code = bitset(code,codeindex,string(index));
	codeindex = codeindex+1;
	byte = decode(bitset(code,codeindex),info);
	if byte>0, % a code has been found
		vector(vectorindex) = byte-1;
		codeindex = 1;
		code = 0;
		vectorindex = vectorindex+1;
	end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function byte = decode(code,info)
byte = info.huffcodes(code);
