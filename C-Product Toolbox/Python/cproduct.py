"""
File with the function of the C-Product Toolbox

References:
    Pablo Soto-Quiros, C-product toolbox, 
    Instituto Tecnológico de Costa Rica,
    https://github.com/jusotoTEC/c-product-toolbox
    
Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
"""
import numpy as np
from scipy.linalg import pinv, svd, sqrtm, qr, norm
from scipy.fftpack import dct, idct


################################ cprod ################################
def cprod(A, B):
    """
    Description: Computes the c-product of two third-order tensors A and B.
    
    Syntax: C = cprod(A, B)
    
    Inputs:
        A: tensor of dimensions m1 x n1 x p1
        B: tensor of dimensions m2 x n2 x p2
    
    Output:
        C: A tensor of dimensions m1 x n2 x p1 (result of A * B)
    
    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """
    
    m1, n1, p1 = A.shape
    m2, n2, p2 = B.shape
    
    if n1 != m2 or p1 != p2:
        raise ValueError("The inner dimensions of the tensors must be compatible.")
    
    At = dct(A, axis=2, norm='ortho')
    Bt = dct(B, axis=2, norm='ortho')
    Ct = np.zeros((m1, n2, p1))
    
    for j in range(p1):
        Ct[:, :, j] = np.dot(At[:, :, j], Bt[:, :, j])
    
    C = idct(Ct, axis=2, norm='ortho')
    return C

################################ cinprod ################################
def cinprod(A, B):
    """
    Description: Computes the inner product between two tensors
    
    Syntax: c = cinprod(A, B)

    Inputs:
    A : tensor of dimension m x n x p
    B : tensor of dimension n x m x p)

    Output:
    c : inner product between tensors A and B

    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """

    if A.shape != B.shape:
        raise ValueError("The inner dimensions of the tensors must be the same.")

    c = 0
    for j in range(A.shape[2]):
        c += np.trace(A[:, :, j].T @ B[:, :, j])
    
    return c

################################ ceye ################################
def ceye(n, p):
    """
    Description: Computes the identity tensor under the c-product.
    
    Syntax: I = ceye(n, p)
    
    Inputs: 
        n = integer, tensor dimension
        p = integer, third dimension of the tensor
    
    Output:
        I = tensor of dimension n x n x p

    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
    
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """
    
    It = np.zeros((n, n, p))
    
    for j in range(p):
        It[:, :, j] = np.eye(n)
    
    I = idct(It, axis=2, norm='ortho')  
    
    return I

################################ ctransp ################################
def ctransp(A):
    """
    Description: Computes the tensor transpose of a third-order tensor 

    Syntax: B = ctransp(A)

    Inputs:
        A: Tensor of dimension m x n x p

    Output:
        B: Tensor of dimension n x m x p, which is the transpose of tensor A.
    
    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
    
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """
    m, n, p = A.shape
    # Apply DCT along the third dimension (axis=2)
    At = dct(A, axis=2, norm='ortho')
    Bt = np.zeros((n, m, p))
    
    # Transpose each 2D slice along the third dimension
    for j in range(p):
        Bt[:, :, j] = At[:, :, j].T
    
    # Apply IDCT along the third dimension (axis=2)
    B = idct(Bt, axis=2, norm='ortho')
    
    return B

################################ csvd ################################
def csvd(A, opt='full'):
    """
    Description: Computes the tensor SVD under the reduced c-product
    
    Syntax: U, S, V = csvd(A, opt)
    
    Inputs: 
        A   = tensor of dimensions m x n x p
        opt = options for different outputs of U, S, and V
              1) 'full': (default) produces full tensor SVD, i.e., A = U*S*V^T, where
                          U = tensor of dimensions m x m x p
                          S = tensor of dimensions m x n x p
                          V = tensor of dimensions n x n x p
              2) 'econ': produces the 'economy size' decomposition. 
                          Let s = min(m,n). Then, A = U*S*V^T, where
                          U = tensor of dimensions m x s x p
                          S = tensor of dimensions s x s x p
                          V = tensor of dimensions n x s x p
    Outputs: U, S, V
            
    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """

    m, n, p = A.shape
    At = dct(A, axis=2, norm='ortho')

    if opt == 'full':
        Ut = np.zeros((m, m, p))
        St = np.zeros((m, n, p))
        Vt = np.zeros((n, n, p))
        for j in range(p):
            Ut[:, :, j], Saux, Vt[:, :, j] = svd(At[:, :, j], full_matrices=True)
            Smat = np.diag(Saux)     
            S_full = np.zeros((m, n))  # Matriz de ceros del mismo tamaño que A
            S_full[:Smat.shape[0], :Smat.shape[1]] = Smat  # Insertar S en la matriz de ceros
            St[:, :, j]=S_full
    elif opt == 'econ':
        s = min(m, n)
        Ut = np.zeros((m, s, p))
        St = np.zeros((s, s, p))
        Vt = np.zeros((n, s, p))
        for j in range(p):
            Ut[:, :, j], St[:, :, j], Vt[:, :, j] = svd(At[:, :, j], full_matrices=False)
    else:
        raise ValueError("Use csvd(A, 'full') or csvd(A) for a full tensor SVD decomposition, or csvd(A, 'econ') for an economy-size tensor SVD decomposition.")

    U = idct(Ut, axis=2, norm='ortho')
    S = idct(St, axis=2, norm='ortho')
    V = idct(Vt, axis=2, norm='ortho')

    return U, S, V

################################ cqr ################################
def cqr(A, opt='full'):
    """
    Description: Computes the tensor QR under the reduced c-product
    
    Syntax: [Q,R] = cqr(A)

    Inputs:
        A : tensor of dimension m x n x p
        opt : options for various outputs of Q and R
              'full' (default) : produces full tensor QR, i.e., A = Q*R, where
                                 Q is a tensor of dimension m x m x p
                                 R is a tensor of dimension m x n x p
              'econ' : produces the 'economy size' decomposition when m > n.
                       Let A = Q*R, where
                       Q is a tensor of dimension m x n x p
                       R is a tensor of dimension n x n x p
                       If m <= n, then the 'economy size' decomposition
                       is the same as the full decomposition.

    Outputs:
        Q, R 

    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """
    
    m, n, p = A.shape
    At = dct(A, axis=2, norm='ortho')

    if opt == 'full' :      
        Qt = np.zeros((m, m, p))
        Rt = np.zeros((m, n, p))
        for j in range(p):
            Qt[:, :, j], Rt[:, :, j] = qr(At[:, :, j])            
    elif opt == 'econ' :
        k=min(m,n)
        Qt = np.zeros((m, k, p))
        Rt = np.zeros((k, n, p))
        for j in range(p):
            Qt[:, :, j], Rt[:, :, j] = qr(At[:, :, j], mode='reduced')
    else:
        raise ValueError("Use cqr(A, 'full') or cqr(A) for a full tensor QR decomposition, or cqr(A, 'econ') for an economy-size tensor QR decomposition.")

    Q = idct(Qt, axis=2, norm='ortho')
    R = idct(Rt, axis=2, norm='ortho')

    return Q, R


################################ csqrtt ################################
def csqrtt(A):
    """
    Description: Computes the principal square root of a
                 third-order tensor under the reduced c-product
    
    Syntax: X = xsqrtt(A)
    
    Inputs: 
        A : tensor of dimension m x m x p with real entries.
    
    Output:
        X : tensor of dimension m x m x p.
        
    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """
    
    # Get the shape of the tensor A
    m, n, p = A.shape
    
    # Check if the tensor is square
    if m != n:
        raise ValueError('Tensor must be square.')
    
    # Apply DCT along the third dimension
    At = dct(A, axis=2, norm='ortho')
    
    # Initialize the tensor for the square root
    Xt = np.zeros((m, m, p))
    
    # Compute the square root of each frontal slice
    for j in range(p):
        Xt[:, :, j] = np.real(sqrtm(At[:, :, j]))
    
    # Apply inverse DCT along the third dimension
    X = idct(Xt, axis=2, norm='ortho')
    
    return X

################################ ctubalrank ################################
def ctubalrank(A):
    """
    Description: Computes the tubal rank of a tensor using the c-SVD method.
    
    Syntax:  trank = ctubalrank(A)
    
    Input:
        A: tensor of dimensions m x n x p.
    
    Output:
        crank: tubal rank constant of tensor A.
    
    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """
    m, n, p = A.shape
    At = dct(A, axis=2, norm='ortho')
    s = min(m, n)
    St = np.zeros((s, 1, p))
    
    for j in range(p):
        _, Saux, _ = svd(At[:, :, j], full_matrices=False)
        St[:, 0, j] = Saux
    
    S = idct(St, axis=2, norm='ortho')
    tol = max(m, n) * np.finfo(float).eps * np.max(np.abs(S[0, :, :]))
    crank = np.sum(np.max(np.abs(S), axis=2) > tol)
    
    return crank

################################ cmultirank ################################
def cmultirank(A):
    """
    Description: Computes the multi-rank of a tensor under the reduced c-product.

    Syntax:  mrank = cmultirank(A)    
    
    
    Input:
        A : tensor of dimension (m, n, p)

    Output:
        mrank :  multi-rank vector of tensor A

    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """

    p = A.shape[2]
    At = dct(A, axis=2, norm='ortho')  # DCT along the third dimension
    mrank = np.zeros(p, dtype=int)

    for j in range(p):
        mrank[j] = np.linalg.matrix_rank(At[:, :, j])
    
    return mrank

################################ cinv ################################
def cinv(A):
    """
    Description: Computes the tensor inverse under the c-product
    
    Syntax: X = cinv(A)
    
    Inputs: 
        A = tensor of dimension m x m x p with real entries
    Output: 
        X = tensor inverse of A using the c-product, with dimensions m x m x p

    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """
    
    m, n, p = A.shape
    
    if m != n:
        raise ValueError('Tensor must be square.')

    At = dct(A, axis=2, norm='ortho')  # Compute the DCT along the 3rd axis
    Xt = np.zeros((m, m, p))           # Initialize the output tensor
    I = np.eye(m)                      # Identity matrix
    
    for j in range(p):
        Xt[:, :, j] = np.linalg.solve(At[:, :, j], I)  # Inverse for each frontal slice
    
    X = idct(Xt, axis=2, norm='ortho')  # Compute the inverse DCT along the 3rd axis
    
    return X


################################ cpinv ################################
def cpinv(A):
    """
    Description: Computes the tensor pseudoinverse under the c-product.
    
    Syntax: X = cpinv(A)
    
    Input: 
        A is a tensor of dimensions m x n x p.
    
    Output: 
        X is the tensor pseudoinverse of A, with dimensions n x m x p.
    
    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """
    
    m, n, p = A.shape
    
    # Compute the DCT along the third dimension
    At = dct(A, axis=2, norm='ortho')
    Xt = np.zeros((n, m, p))
    
    # Compute the pseudoinverse for each frontal slice
    for j in range(p):
        Xt[:, :, j] = pinv(At[:, :, j])
    
    # Compute the inverse DCT along the third dimension
    X = idct(Xt, axis=2, norm='ortho')
    
    return X

################################ cdrazin ################################
def cdrazin(A):
    """
    Description: Computes the tensor Drazin inverse and the multi-index
                 of a third-order tensor under the c-product.
                 
    Syntax: [X,t] = cdrazin(A)                 

    Parameters:
        A : tensor of dimension (m, m, p)

    Returns:
    X : tensor Drazin inverse of A using the c-product, with dimensions m x m x p
    t : multi-index vector of dimension p

    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """

    m, n, p = A.shape

    # Apply Discrete Cosine Transform along the third dimension
    At = dct(A, axis=2, norm='ortho')
    Xt = np.zeros((n, m, p))

    # Compute multi-index vector
    t = np.array([ind(At[:, :, j]) for j in range(p)])

    # Compute Drazin inverse for each frontal slice
    for j in range(p):
        Xt[:, :, j] = mdrazin(At[:, :, j], t[j])

    # Apply Inverse Discrete Cosine Transform along the third dimension
    X = idct(Xt, axis=2, norm='ortho')

    return X, t


def ind(A):
    """
    Compute the index of matrix A, which is the least nonnegative
    integer k such that rank(A^(k+1)) = rank(A^k).
    """
    m = A.shape[0]
    if np.linalg.matrix_rank(A) == m:
        return 0

    k = 1
    Ak = A.copy()
    while np.linalg.matrix_rank(Ak) != np.linalg.matrix_rank(Ak @ A):
        Ak = Ak @ A
        k += 1

    return k


def mdrazin(A, k):
    """
    Compute the Drazin inverse of matrix A with index k.

    """
    m = A.shape[0]
    if np.linalg.matrix_rank(A) == m:
        return np.linalg.solve(A, np.eye(m))

    Ak = np.linalg.matrix_power(A, k)
    Ad = Ak @ pinv(Ak @ Ak @ A) @ Ak
    return Ad






################################ cnorm ################################
def cnorm(A, opt='fro'):
    """
    Description: Computes the tensor norm under the c-product
    
    Syntax: z = cnorm(A,opt)   
    
    Inputs:
        A   : tensor of dimension m x n x p
        opt : options for various types of tensor norms
              1) 'fro' : the Frobenius norm
              2) 'spec': the spectral norm
              3) 'nuc' : the nuclear norm
    
    Output:
        z : a non-negative number
    
    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """
    
    # Frobenius norm
    if opt == 'fro':
        z = np.sqrt(np.sum(A**2))
    
    # Spectral norm
    elif opt == 'spec':
        p = A.shape[2]
        At = dct(A, axis=2, norm='ortho')  
        vect = np.zeros(p)
        for k in range(p):
            vect[k] = norm(At[:, :, k], ord=2)
        z = np.max(vect)
    
    # Nuclear norm
    elif opt == 'nuc':
        m, n, p = A.shape
        At = dct(A, axis=2, norm='ortho')
        z = 0
        for k in range(p):
            s = svd(At[:, :, k], compute_uv=False)
            z += np.sum(s[:min(m, n)])
    
    else:
        raise ValueError("The only matrix norms available are 'fro', 'spec', and 'nuc'.")
    
    return z

################################ clowrank ################################
def clowrank(A, r):
    """
    Description: Computes the solution of the low-tubal-rank tensor problem under the reduced c-product.
    
    Syntax: Ar = clowrank(A,r)

    Inputs:
        A : tensor of dimension m x n x p
        r : positive integer such that r <= min(m, n)

    Output:
        Ar : tensor of dimension m x n x p

    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """

    m, n, p = A.shape

    if r > min(m, n):
        raise ValueError("The requested rank 'r' exceeds the minimum of the number of rows and columns of the matrix.")

    if r < 0 or not isinstance(r, int):
        raise ValueError("The requested rank 'r' must be a positive integer.")

    At = dct(A, axis=2, norm='ortho')

    Art = np.zeros_like(A)
    for j in range(p):
        U, S, Vt = svd(At[:, :, j], full_matrices=False)
        Art[:, :, j] = U[:, :r] @ np.diag(S[:r]) @ Vt[:r, :]

    Ar = idct(Art, axis=2, norm='ortho')

    return Ar

################################ csvt ################################
def csvt(A,t):
    """
    Description: Computes the solution of the tensor singular value thresholding 
                 problem under the reduced c-product.

    Inputs:
        A : tnsor of dimension (m, n, p)
        t : positive constant

    Output:
        D : tensor of dimension (m, n, p)

    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """

    m, n, p = A.shape
    At = dct(A, axis=2, norm='ortho')  
    Dt = np.zeros((m, n, p))

    for j in range(p):
        Utj, Saux, Vtj = svd(At[:, :, j], full_matrices=True)  
        Smat = np.maximum(np.diag(Saux) - t, 0)
        S_full = np.zeros((m, n))  
        S_full[:Smat.shape[0], :Smat.shape[1]] = Smat 
        Stj=S_full
        Dt[:, :, j] = Utj @ Stj @ Vtj

    D = idct(Dt, axis=2, norm='ortho')  
    
    return D

################################ clsq ################################
def clsq(A, B, C):
    """
    Description: Computes the solution of the tensor least squares problem under the reduced c-product.

    Inputs:
        A : tensor of dimension (m, n, p)
        B : tensor of dimension (m, r, p)
        C : tensor of dimension (s, n, p)
        
    Output:
        X : tensor of dimension (r, s, p)

    References:
        Pablo Soto-Quiros, C-product toolbox, 
        Instituto Tecnológico de Costa Rica,
        https://github.com/jusotoTEC/c-product-toolbox
        
    Code written by: Pablo Soto-Quiros (jusoto8@tec.ac.cr)
    """

    m1, n1, p1 = A.shape
    m2, _, p2 = B.shape
    _, n3, p3 = C.shape

    if p1 != p2 or p2 != p3 or p1 != p3 or m1 != m2 or n1 != n3:
        raise ValueError("The tensor dimensions are incorrect. Please check the dimensions of all three tensors.")

    Bp = cpinv(B)
    Cp = cpinv(C)
    X = cprod(cprod(Bp, A), Cp)

    return X
