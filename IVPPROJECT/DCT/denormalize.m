function [ Denormalized ] = denormalize( ReducedDCTCoefficients, m,n,p,q )

Denormalized = zeros(m,n,p,q);

for h = 1:p
    for j = 1:q
        Denormalized(:,:,h,j) = multiply(ReducedDCTCoefficients(:,:,h,j),m,n);
    end
end

end