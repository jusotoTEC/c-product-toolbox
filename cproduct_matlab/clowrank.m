function Ar=clowrank(A,r)

    %       Description: Computes solution of the low-tubal-rank tensor 
    %                    problem under the reduced c-product
    %   Syntax Function: Ar = clowrank(A,r)
    %            Inputs: A  = tensor of dimension  m x n x p
    %                    r  = positive integer such that r<=min(m,n)
    %            Output: Ar = tensor of dimension  m x n x p
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)
            
    [m,n,p]=size(A);     
    if r>min(m,n)
        error('The requested rank ''r'' exceeds the minimum of the number of rows and columns of the matrix')
    end    
    if or(r<0,abs(r-floor(r))~=0)
        error('The requested rank ''r'' must be a positive integer')
    end   

    At = dct(A, [], 3);    
    Art=zeros(m,n,p);
    for j = 1:p
        [Urj,Srj,Vrj] = svd(At(:, :, j),'econ');  
        Art(:,:,j)=Urj(:,1:r)*Srj(1:r,1:r)*(Vrj(:,1:r))';
    end    
    Ar = idct(Art, [], 3);    
    
end