function encoded = encoderle(input)
 
my_size = size(input);
length = my_size(2);
 
run_length = 1;
encoded = [];
 
for i=2:length
    if input(i) == input(i-1)
        run_length = run_length + 1;
    else
        encoded = [encoded input(i-1) run_length];
        run_length = 1;
    end
end
 
if length > 1
    % Add last value and run length to output
    encoded = [encoded input(i) run_length];
else
    % Special case if input is of length 1
    encoded = [input(1) 1];
end