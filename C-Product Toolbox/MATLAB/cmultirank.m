function mrank=cmultirank(A)

    %       Description: Computes the multi-rank of a tensor 
    %                    under the reduced c-product
    % Sintaxis Function: mrank = cmultirank(A)
    %            Inputs:   A   = tensor of dimension m x n x p
    %            Output: mrank = vector of dimension p
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)
          
    p=size(A,3); 
    At = dct(A, [], 3);        
    mrank=zeros(1,p);
    for j = 1:p
        mrank(j)=rank(At(:,:,j));
    end    
   
end
