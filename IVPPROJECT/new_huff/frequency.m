function f = frequency(vector)

% ensure to handle uint8 input vector
if ~isa(vector,'uint8'),
	error('input argument must be a uint8 vector')
end

% create f
f = histc(vector(:), 0:255); f = f(:)'/sum(f); % always make a row of it
