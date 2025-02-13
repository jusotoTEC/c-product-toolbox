"""
Numerical Examples
Paper: C-Product Toolbox: A new MATLAB toolbox for third-order tensor operations using the reduced c-product
Authors: Soto-Quiros, Pablo and Valverde-Sanchez, Samuel
Year: 2025
Status: Paper under submission
"""

import numpy as np

from cproduct import (
    cprod, cinprod, ceye, ctransp, csvd, cqr, csqrtt, ctubalrank, cmultirank,
    cinv, cpinv, cdrazin, cnorm, clowrank, csvt, clsq
)

def test_toolbox():
    
    """
    The variable 'opt' allows selecting the numerical example
    Alternatives for variable 'opt':
       opt = 1  : cprod
       opt = 2  : cinprod
       opt = 3  : ceye
       opt = 4  : ctransp
       opt = 5  : csvd
       opt = 6  : cqr
       opt = 7  : csqrtt
       opt = 8  : ctubalrank
       opt = 9  : cmultirank
       opt = 10 : cinv
       opt = 11 : cpinv
       opt = 12 : cdrazin
       opt = 13 : cnorm
       opt = 14 : clowrank
       opt = 15 : csvt
       opt = 16 : clsq    
    """
    opt = 1  # Vatiable 'opt'

    if opt == 1:
        print("Example 1: 'cprod' command")
        A = np.zeros((2,2,3))
        B = np.zeros((2,2,3))
        A[:,:,0] = [[-2, 0], [1, 0]]
        A[:,:,1] = [[2, 1], [1, 2]]
        A[:,:,2] = [[3, -2], [0, -1]]
        B[:,:,0] = [[2, -1], [0, 0]]
        B[:,:,1] = [[-1, -3], [0, 2]]
        B[:,:,2] = [[1, 2], [-1, -1]]
        print("Result:")
        C = cprod(A, B)
        print('C[:,:,0]=')
        print(C[:,:,0])
        print('C[:,:,1]=')
        print(C[:,:,1])
        print('C[:,:,2]=')
        print(C[:,:,2])

    elif opt == 2:
        print("Example 2: 'cinprod' command")
        A = np.zeros((2,2,3))
        B = np.zeros((2,2,3))
        A[:,:,0] = [[-2, 0], [1, 0]]
        A[:,:,1] = [[2, 1], [1, 2]]
        A[:,:,2] = [[3, -2], [0, -1]]
        B[:,:,0] = [[2, -1], [0, 0]]
        B[:,:,1] = [[-1, -3], [0, 2]]
        B[:,:,2] = [[1, 2], [-1, -1]]
        print("Result:")
        c = cinprod(A, B)
        print(c)

    elif opt == 3:
        print("Example 3: 'ceye' command")
        print("Result:")
        I = ceye(2, 2)
        print('I[:,:,0]=')
        print(I[:,:,0])
        print('I[:,:,1]=')
        print(I[:,:,1])

    elif opt == 4:
        print("Example 4: 'ctransp' command")
        A = np.zeros((2,3,2))
        A[:,:,0] = [[1, -1, -2], [-2, 3, 1]]
        A[:,:,1] = [[-2, 3, 1], [1, 0, -1]]
        print("Result:")
        C = ctransp(A)
        print('C[:,:,0]=')
        print(C[:,:,0])
        print('C[:,:,1]=')
        print(C[:,:,1])

    elif opt == 5:
        print("Example 5: 'csvd' command")
        A = np.zeros((2,3,2))
        A[:,:,0] = [[1, -1, -2], [-2, 3, 1]]
        A[:,:,1] = [[-2, 3, 1], [1, 0, -1]]
        print("Result:")
        U, S, V = csvd(A)
        print('U[:,:,0]=')
        print(U[:,:,0])
        print('U[:,:,1]=')
        print(U[:,:,1])
        print('S[:,:,0]=')
        print(S[:,:,0])
        print('S[:,:,1]=')
        print(S[:,:,1])
        print('V[:,:,0]=')
        print(V[:,:,0])
        print('V[:,:,1]=')
        print(V[:,:,1])

    elif opt == 6:
        print("Example 6: 'cqr' command")
        A = np.zeros((2, 3, 2))
        A[:, :, 0] = np.array([[1, -1, -2], [-2, 3, 1]])
        A[:, :, 1] = np.array([[-2, 3, 1], [1, 0, -1]])
        Q, R = cqr(A)
        print("Result:")
        print('Q[:,:,0]=')
        print(Q[:,:,0])
        print('Q[:,:,1]=')
        print(Q[:,:,1])
        print('R[:,:,0]=')
        print(R[:,:,0])
        print('R[:,:,1]=')
        print(R[:,:,1])
        
    elif opt == 7:
        print("Example 7: 'csqrtt' command")
        A = np.zeros((2, 2, 3))
        A[:, :, 0] = np.array([[6.989, 1.711], [1.711, 7.855]])
        A[:, :, 1] = np.array([[-4.222, 0.676], [0.676, 3.802]])
        A[:, :, 2] = np.array([[4.161, 4.540], [4.540, 2.198]])
        B = csqrtt(A)
        print("Result:")        
        print('B[:,:,0]=')
        print(B[:,:,0])
        print('B[:,:,1]=')
        print(B[:,:,1])
        print('B[:,:,2]=')
        print(B[:,:,2])   
        
    elif opt == 8:    
        print("Example 8: 'ctubalrank' command")
        B = np.zeros((2, 1, 3))
        C = np.zeros((1, 3, 3))                
        B[:,:,0] = np.transpose([[1, -1]])
        B[:,:,1] = np.transpose([[1, 1]])
        B[:,:,2] = np.transpose([[1, 0]])        
        C[:,:,0] = [-2, -1, 2]
        C[:,:,1] = [-2, 2, 0]
        C[:,:,2] = [2, -2, 0]                
        A = cprod(B, C)
        r = ctubalrank(A)        
        print("Result:")        
        print(r)
    
    elif opt == 9:    
        print("Example 9: 'cmultirank' command")
        B = np.zeros((2, 1, 3))
        C = np.zeros((1, 3, 3))                
        B[:,:,0] = np.transpose([[1, -1]])
        B[:,:,1] = np.transpose([[1, 1]])
        B[:,:,2] = np.transpose([[1, 0]])        
        C[:,:,0] = [-2, -1, 2]
        C[:,:,1] = [-2, 2, 0]
        C[:,:,2] = [2, -2, 0]                
        A = cprod(B, C)
        t = cmultirank(A)                
        print("Result:")    
        print(t)       

    elif opt == 10:
        print("Example 10: 'cinv' command")
        A = np.zeros((2, 2, 2))
        A[:,:,0] = [[1, -1], [0, -1]]
        A[:,:,1] = [[0, 2], [-1, -2]]        
        B = cinv(A)        
        print("Result:")
        print('B[:,:,0]=')
        print(B[:,:,0])
        print('B[:,:,1]=')
        print(B[:,:,1])       

    elif opt == 11:
        print("Example 11: 'cpinv' command")
        A = np.zeros((2, 3, 2))
        A[:,:,0] = [[1, -1, -2], [-2, 3, 1]]
        A[:,:,1] = [[-2, 3, 1], [1, 0, -1]]        
        print("Result:")
        B = cpinv(A)
        print("Result:")
        print('B[:,:,0]=')
        print(B[:,:,0])
        print('B[:,:,1]=')
        print(B[:,:,1])   
        
    elif opt == 12:
        print("Example 12: 'cdrazin' command")    
        A = np.zeros((3, 3, 3))
        A[:,:,0] = [[4, -4, -1], [-7, -8, 7], [-1, -2, 0]]
        A[:,:,1] = [[-2, 2, 1], [4, 4, -4], [0, 1, 0]]
        A[:,:,2] = [[-1, 2, 0], [3, 4, -2], [1, 1, 0]]                
        X, t = cdrazin(A)
        print("Result:")
        print('X[:,:,0]=')
        print(X[:,:,0])
        print('X[:,:,1]=')
        print(X[:,:,1])
        print('X[:,:,2]=')
        print(X[:,:,2])   
        print("t:", t)
    
    elif opt == 13:
        print("Example 13: 'cnorm' command")
        A = np.zeros((2, 3, 2))
        A[:, :, 0] = np.array([[1, -1, -2], [-2, 3, 1]])
        A[:, :, 1] = np.array([[-2, 3, 1], [1, 0, -1]])            
        n1 = cnorm(A)
        n2 = cnorm(A, opt='spec')
        n3 = cnorm(A, opt='nuc')
        print("Result:")
        print(f'Frobenius norm = {n1}')
        print(f'Spectral norm = {n2}')
        print(f'Nuclear norm = {n3}')
        
    elif opt == 14:
        print("Example 14: 'clowrank' command")
        A = np.zeros((2,3,2))
        A[:,:,0] = [[1, -1, -2], [-2, 3, 1]]
        A[:,:,1] = [[-2, 3, 1], [1, 0, -1]]
        r = 1
        Ar = clowrank(A, r)
        print("Result:")
        print('Ar[:,:,0]=')
        print(Ar[:,:,0])
        print('Ar[:,:,1]=')
        print(Ar[:,:,1]) 
    
    elif opt == 15:        
        print("Example 15: 'csvt' command")
        A = np.zeros((2, 3, 2))
        A[:, :, 0] = np.array([[1, -1, -2], [-2, 3, 1]])
        A[:, :, 1] = np.array([[-2, 3, 1], [1, 0, -1]])
        t = 0.5        
        X = csvt(A, t)
        print("Result:")        
        print('X[:,:,0]=')
        print(X[:,:,0])
        print('X[:,:,1]=')
        print(X[:,:,1])        

    elif opt == 16:
        print("Example 16: 'clsq' command")
        A = np.zeros((2,3,2))
        B = np.zeros((2,2,2))
        C = np.zeros((1,3,2))
        A[:,:,0] = [[1, -1, -1], [0, -2, -3]]
        A[:,:,1] = [[-2, 2, 1], [1, 0, -1]]
        B[:,:,0] = [[1, 0], [0, 1]]
        B[:,:,1] = [[0, 3], [2, 0]]
        C[:,:,0] = [[0, -2, 1]]
        C[:,:,1] = [[1, -1, 1]]
        print("Result:")
        X = clsq(A, B, C)
        print('X[:,:,0]=')
        print(X[:,:,0])
        print('X[:,:,1]=')
        print(X[:,:,1])  

# Run file
test_toolbox()