function decoded = pptDECODRLE(encoded)
 
my_size = size(encoded);
length = my_size(2);
 
index = 1;
decoded = [];
% iterate through the input
while (index <= length)
    value = encoded(index);
    run_length = encoded(index + 1);
    for i=1:run_length
        decoded = [decoded value];
    end
    index = index + 2;
end