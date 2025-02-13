function crank=ctubalrank(A)

    %       Description: Computes the tubal rank of a tensor 
    %                    using the c-SVD method
    % Sintaxis Function: trank = ctubalrank(A)
    %            Inputs:   A   = tensor of dimension  m x n x p
    %            Output: crank = tubal rank constant of tensor A
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)
          
    [m,n,p]=size(A); 
    At = dct(A, [], 3);        
    s=min([m n]);
    St=zeros(s,1,p);
    for j = 1:p
        St(:,:,j) = svd(At(:, :, j),'econ');  
    end    
    S=idct(St, [], 3);
    smax=S(1,1,:);
    tol=max([m n])*eps*norm(smax(:));   
    crank=sum(vecnorm(S,2,3)>tol);    
end