function X=cpinv(A)

    %       Description: Computes the tensor pseudoinverse using the reduced c-product
    %   Syntax Function: X = cpinv(A)
    %            Inputs: A = tensor of dimension  m x n x p with real
    %                        entries
    %            Output: X = tensor pseudoinverse of A using the reduced c-product, 
    %                        with dimensions n x m x p
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)
    
    [m,n,p]=size(A); 
        
    At = dct(A, [], 3);
    Xt = zeros(n, m, p);
    for j = 1:p
        Xt(:, :, j) = pinv(At(:, :, j));  
    end
    X = idct(Xt, [], 3);    
    
end