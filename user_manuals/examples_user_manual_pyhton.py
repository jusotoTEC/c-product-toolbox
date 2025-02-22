'''
Example of applying the C-Product Toolbox functions in MATLAB

        References: C-product toolbox
                    https://github.com/jusotoTEC/c-product-toolbox    

   Code written by: Pablo Soto-Quiros (jusoto@tec.ac.cr) and
                    Luis Chavarria-Zamora (lachavarria@itcr.ac.cr)
'''                   

# Example application of the C-Product Toolbox functions in Python

import cproduct as cp         # Import the C-Product Toolbox
import numpy as np            # Import NumPy

A = np.random.rand(10,5,3)    # Third-order tensor generated ...
                              # ... randomly with uniform distribution
B = np.random.rand(5,5,3)     # Third-order tensor generated ...
                              # ... randomly with uniform distribution
C = cp.cprod(A,B);            # c-product between A and B
c = cp.cprod(A,B)             # Tensor inner product between A and B
I = cp.ceye(10,5)             # Identity tensor of size 10 x 10 x 5
At = cp.ctransp(A)            # Tensor transpose of A
[U,S,V] = cp.csvd(A)          # c-SVD of A
[Q,R] = cp.cqr(A)             # c-QR of A
X1 = cp.cqr(A)                # Tensor square root of A
trank = cp.ctubalrank(A)      # Tubal rank of A
mrank = cp.cmultirank(A)      # Multi-rank of A
X2 = cp.cinv(B)               # c-inverse of B
X3 = cp.cpinv(A)              # c-pseudoinverse of A
[X4,t] = cp.cdrazin(B)        # c-Drazin inverse of A and multi-index
z1 = cp.cnorm(A,'fro')        # Frobenius tensor norm of A
z2 = cp.cnorm(A,'spec')       # Spectral tensor norm of A
z3 = cp.cnorm(A,'nuc')        # Nuclear tensor norm of A
Ar = cp.clowrank(A,3)         # Tensor solution of the ...
                              # ... tensor approximation problem with tubal rank 3
X5 = cp.csvt(A,0.5)           # Tensor solution of the ...
                              # ... tensor singular value thresholding problem ...
                              # ... with tau=0.5
A1 = np.random.rand(5,4,3)    # Third-order tensor generated ...
                              # ... randomly with uniform distribution
B1 = np.random.rand(5,2,3)    # Third-order tensor generated ...
                              # ... randomly with uniform distribution
C1 = np.random.rand(2,4,3)    # Third-order tensor generated ...
                              # ... randomly with uniform distribution
X6 = cp.clsq(A1,B1,C1)        # Tensor solution of the tensor least squares problem