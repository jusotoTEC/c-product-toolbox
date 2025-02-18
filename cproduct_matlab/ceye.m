function I=ceye(n,p)

    %       Description: Computes the identity tensor under the reduced c-product
    %   Syntax Function: I = ceye(n,p)
    %            Inputs: n = positive integer
    %                    p = positive integer 
    %            Output: I = identity tensor of dimension n x n x p
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)
          
    It=zeros(n,n,p);
    for j = 1:p
        It(:,:,j) = eye(n);  
    end    
    I=idct(It, [], 3);       
    
end