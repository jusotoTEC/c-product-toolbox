function [U,S,V]=csvd(A,opt)

    %       Description: Computes the tensor SVD under the reduced c-product
    %   Syntax Function: [U,S,V] = cpinv(A,opt)
    %            Inputs: A   = tensor of dimension  m x n x p
    %                    opt = options for various outputs of U, S, and V
    %                          1) 'full':   (default) produces full tensor SVD, i.e., A = U*S*V^T, where
    %                                       U  = tensor of dimension m x m x p
    %                                       S  = tensor of dimension m x n x p
    %                                       V  = tensor of dimension n x n x p
    %                          2) 'econ':   produces the 'economy size' decomposition. 
    %                                       Let s = min(m,n). Then, A = U*S*V^T, where
    %                                       U = tensor of dimension m x s x p
    %                                       S = tensor of dimension s x s x p
    %                                       V = tensor of dimension n x s x p
    %            Output: U, S, V
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)
    
    if nargin < 2
        opt = 'full';
    end        
    
    [m,n,p]=size(A); 
    At = dct(A, [], 3);    
    
    if strcmp(opt,'full')
        Ut=zeros(m,m,p);
        St=zeros(m,n,p);
        Vt=zeros(n,n,p);
        for j = 1:p
            [Ut(:,:,j),St(:,:,j),Vt(:,:,j)] = svd(At(:, :, j));  
        end
    elseif strcmp(opt,'econ')
        s=min([m n]);
        Ut=zeros(m,s,p);
        St=zeros(s,s,p);
        Vt=zeros(s,n,p);        
        for j = 1:p
            [Ut(:,:,j),St(:,:,j),Vt(:,:,j)] = svd(At(:, :, j),'econ');  
        end
    else
        error('Use csvd(A, ''full'') or csvd(A) for a full tensor SVD decomposition, or csvd(A, ''econ'') for an economy-size tensor SVD decomposition.');
    end
    
    U = idct(Ut, [], 3);    
    S = idct(St, [], 3);    
    V = idct(Vt, [], 3);    
    
end