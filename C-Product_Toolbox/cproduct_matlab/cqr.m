function [Q,R]=cqr(A,opt)

    %       Description: Computes the tensor QR under the reduced c-product
    %   Syntax Function: [Q,R] = cqr(A,opt)
    %            Inputs: A   = tensor of dimension  m x n x p
    %                    opt = options for various outputs of Q and R
    %                          1) 'full':   (default) produces full tensor QR, i.e., A = Q*R, where
    %                                       Q  = tensor of dimension m x m x p
    %                                       R  = tensor of dimension m x n x p
    %                          2) 'econ':   produces the 'economy size' decomposition when m > n. 
    %                                       Let A = Q*R, where
    %                                       Q = tensor of dimension m x n x p
    %                                       R = tensor of dimension n x n x p
    %                                       If m <= n, then the 'economy size' decomposition 
    %                                       is the same as the full decomposition.
    %
    %            Output: Q, R
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
    
    if strcmp(opt,'full') || and(strcmp(opt,'econ'),m <= n)
        Qt=zeros(m,m,p);
        Rt=zeros(m,n,p);
        for j = 1:p
            [Qt(:,:,j),Rt(:,:,j)] = qr(At(:, :, j));  
        end
    elseif and(strcmp(opt,'econ'), m > n)
        Qt=zeros(m,n,p);
        Rt=zeros(n,n,p);
        for j = 1:p
            [Qt(:,:,j),Rt(:,:,j)] = qr(At(:, :, j),'econ');  
        end
    else
        error('Use cqr(A, ''full'') or cqr(A) for a full tensor QR decomposition, or cqr(A, ''econ'') for an economy-size tensor QR decomposition.');
    end
    
    Q = idct(Qt, [], 3);    
    R = idct(Rt, [], 3);    
    
end