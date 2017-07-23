function y = genzigzag(array,m,n,p,q)

y = zeros(m*n,1,p,q);

for h = 1:p
    for j = 1:q
        
        y(:,1,h,j) = zigzag(array(:,:,h,j));
       
    end
end

end