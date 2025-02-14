function X=cinv(A)

    %       Description: Computes the tensor inverse under the reduced c-product
    %   Syntax Function: X = cinv(A)
    %            Inputs: A = tensor of dimension m x m x p
    %            Output: X = tensor of dimension m x m x p
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)
    
    [m,n,p]=size(A); 
    
    if m ~= n 
        error('Tensor must be square.');
    end
        
    At = dct(A, [], 3);
    Xt = zeros(m, m, p);
    I=eye(m);
    for j = 1:p
        Xt(:, :, j) = At(:, :, j)\I;  
    end
    X = idct(Xt, [], 3);    
    
end