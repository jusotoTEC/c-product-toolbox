function z=cnorm(A,opt)

    %       Description: Computes the tensor norm under the c-product
    %   Syntax Function: z=cnorm(A,opt)
    %            Inputs: A   = tensor of dimension  m x n x p
    %                    opt = options for various types of tensor norms
    %                          1) 'fro' : the Frobenius norm
    %                          2) 'spec': the spectral norm
    %                          3) 'nuc' : the nuclear norm
    %
    %            Output: z = non-negative number
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)

    if nargin < 2
        opt = 'fro';
    end  

    if strcmp(opt,'fro')
        z=sqrt(sum(sum(sum(A.^2))));
    elseif strcmp(opt,'spec')
        p=size(A,3);
        At=dct(A, [], 3);
        z=0;
        for k=1:p
            z=max(norm(At(:,:,k)),z);
        end
    elseif strcmp(opt,'nuc')
        [m,n,p]=size(A);
        At=dct(A, [], 3);
        z=0;
        for k=1:p
            s=svd(At(:,:,k),'econ');
            z=z+sum(s(1:sum(min(m,n))));
        end       
    else
        error('The only matrix norms available are ''fro'', ''spec'' and ''nuc''.');
    end

end