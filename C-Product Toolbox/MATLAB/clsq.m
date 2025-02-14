function X=clsq(A,B,C)

    %       Description: Computes solution of the tensor least squares 
    %                    problem under the reduced c-product
    % Sintaxis Function: X = clsq(A,B,C)
    %            Inputs: A = tensor of dimension  m x n x p
    %                    B = tensor of dimension  m x r x p
    %                    C = tensor of dimension  s x n x p
    %            Output: X = tensor of dimension  r x s x p
    %
    %        References: Pablo Soto-Quiros, C-product toolbox, 
    %                    Instituto Tecnológico de Costa Rica,
    %                    https://github.com/jusotoTEC/c-product-toolbox
    %
    %   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr)

    [m1,n1,p1] =size(A);
    [m2,~,p2] =size(B);
    [~,n3,p3] =size(C);
    
    if p1~=p2 || p2~= p3 || p1~=p3 || m1~=m2 || n1~=n3
        error('The tensor dimensions are incorrect. Please check the dimensions of all three tensors.')
    end

    Bp=cpinv(B);
    Cp=cpinv(C);
    X=cprod(cprod(Bp,A),Cp);

end