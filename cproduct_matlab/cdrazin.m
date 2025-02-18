function [X,t]=cdrazin(A)

    %       Description: Computes the tensor Drazin inverse and the multiindex
    %                    of a third-order tensor under the c-product
    %   Syntax Function: [X,t] = cdrazin(A)
    %            Inputs: A = tensor of dimension  m x m x p 
    %            Output: X = tensor of dimension  m x m x p
    %                    t = vector of dimension p       
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)
    
    [m,n,p]=size(A); 
        
    At = dct(A, [], 3);
    Xt = zeros(n, m, p);
    
    t=zeros(p,1);
    for j=1:p
        t(j)=ind(At(:,:,j));
    end
    
    for j = 1:p
        Xt(:, :, j) = mdrazin(At(:, :, j),t(j));  
    end
    X = idct(Xt, [], 3);    
    
end

function k=ind(A)

    % Auxiliar function:
    % Compute the index of matrix A, which is the least nonnegative  
    % integer k such that rank(A^(k+1)) = rank(A^k). 

    m=size(A,1);    
    if rank(A)==m
        k=0;
    else
        k = 1;
        Ak = A;
        while rank(Ak) ~= rank(Ak * A)
            Ak = Ak * A;
            k = k + 1;
        end
    end

end


function Ad = mdrazin(A,k)

    % Auxiliar function:
    % Compute the Drazin inverse of matrix A with index k
    
    m=size(A,1);    
    if rank(A)==m
        Ad=A\eye(m);
    else
        Ak=A^k;
        Ad=Ak*pinv(Ak*Ak*A)*Ak;
    end
end