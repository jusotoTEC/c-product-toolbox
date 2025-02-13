function c = cinprod(A,B)

    %       Description: Computes the inner product between two tensors
    %   Syntax Function: c = cinprod(A,B)
    %            Inputs: A = tensor of dimension  m x n x p
    %                    B = tensor of dimension  n x m x p
    %            Output: c = inner product between tensors A and B   
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)
      
    
    [m1,n1,p1]=size(A); [m2,n2,p2]=size(B);
    
    if m1 ~= m2 || n1 ~= n2 || p1 ~= p2
        error('The inner dimensions of the tensors must be same.');
    end
        
    c=0;    
    for j = 1:p1
        c = c + trace(((A(:,:,j)).')*(B(:,:,j)));  
    end            
    
end