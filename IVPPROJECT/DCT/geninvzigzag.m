function y = geninvzigzag(array,m,n,p,q)

y = zeros(8,8,p,q);

for h = 1:p
    for j = 1:q
        
        block = invzigzag(array(:,1,h,j));
        y(:,:,h,j) = block;
    end
end

end
