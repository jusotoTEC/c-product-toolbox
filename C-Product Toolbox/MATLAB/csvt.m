function D=csvt(A,r)

    %       Description: Computes solution of the tensor singular value 
    %                    thresholding problem under the reduced c-product
    %   Syntax Function: X = csvt(A,t)
    %            Inputs: A = tensor of dimension  m x n x p
    %                    t = constant positive  
    %            Output: X = tensor of dimension  m x n x p
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)
        
    [m,n,p]=size(A); 
    At = dct(A, [], 3);    
    s=min([m n]);
    Dt=zeros(m,n,p);
    rI=r*eye(s);
    for j = 1:p
        [Utj,Stj,Vtj] = svd(At(:, :, j),'econ');  
        Sr=max(Stj-rI,0);
        Dt(:,:,j)=Utj*Sr*Vtj';
    end
    
    D = idct(Dt, [], 3);       
end