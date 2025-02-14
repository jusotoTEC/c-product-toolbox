function B = ctransp(A)

    %       Description: Computes the tensor transpose of a thrid order tensor 
    %                    under the reduced c-product
    %   Syntax Function: B = ctransp(A)
    %            Inputs: A = tensor of dimension  m x n x p
    %            Output: B = tensor of dimension  n x m x p
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)
      
    [m,n,p]=size(A);    
    At=dct(A, [], 3);     
    Bt=zeros(n,m,p);
    for j = 1:p
        Bt(:,:,j) = (At(:,:,j)).';  
    end    
    B=idct(Bt, [], 3);       
    
    
end