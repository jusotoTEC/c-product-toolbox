function C=cprod(A,B)

    %       Description: Computes the recued c-product between two tensors
    %   Syntax Function: C = cprod(A,B)
    %            Inputs: A = tensor of dimension  m1 x n1 x p1
    %                    B = tensor of dimension  m2 x n2 x p2
    %            Output: C = tensor of dimension  m1 x n2 x p1, where C=A*B
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)
    
    [m1,n1,p1]=size(A); [m2,n2,p2]=size(B);
    
    if n1 ~= m2 || p1 ~= p2
        error('The inner dimensions of the tensors must be compatible.');
    end
    
    At = dct(A, [], 3);
    Bt = dct(B, [], 3);
    Ct = zeros(m1, n2, p1);
    for j = 1:p1
        Ct(:, :, j) = At(:, :, j)*Bt(:, :, j);        
    end
    C = idct(Ct, [], 3);    
    
end