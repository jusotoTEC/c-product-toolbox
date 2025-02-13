function I=ceye(n,p)

    %       Description: Computes the indentity tensor under the reduced c-product
    %   Syntax Function: I = ceye(n,p)
    %            Inputs: A = tensor of dimension  m x n x p
    %            Output: trank = tubal rank constant of tensor A
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