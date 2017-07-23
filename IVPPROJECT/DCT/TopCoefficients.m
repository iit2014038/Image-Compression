function [ ReducedDCTCoefficients ] = TopCoefficients( DCTCoefficients,m,n,p,q )
%TopCoefficients: Take the top k coefficients from each 8x8 block

ReducedDCTCoefficients = zeros(m,n,p,q);

for h = 1:p
    for j = 1:q
        ReducedDCTCoefficients(:,:,h,j) = normalize(DCTCoefficients(:,:,h,j),m,n);
        ReducedDCTCoefficients(:,:,h,j);
    end
end

end