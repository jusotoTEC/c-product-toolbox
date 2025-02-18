 % Example of applying the C-Product Toolbox functions in MATLAB

 A = rand(10,5,3);         % Third-order tensor generated ...
                           % ... randomly with uniform distribution
 B = rand(5,5,3);          % Third-order tensor generated ...
                           % ... randomly with uniform distribution
 C = cprod(A,B);           % c-product between A and B
 c = cprod(A,B);           % Tensorial inner product between A and B
 I = ceye(10,5);           % Identity tensor of size 10 x 10 x 5
 At = ctransp(A);          % Tensorial transpose of A
 [U,S,V] = csvd(A);        % c-SVD of A
 [Q,R] = cqr(A);           % c-QR of A
 X1 = cqr(A);              % Tensorial square root of A
 trank = ctubalrank(A);    % Tubal rank of A
 mrank = cmultirank(A);    % Multi-rank of A
 X2 = cinv(B);             % c-inverse of B
 X3 = cpinv(A);            % c-pseudoinverse of A
 [X4,t] = cdrazin(B);      % c-Drazin inverse of B and multi-index
 z1 = cnorm(A,'fro');      % Frobenius tensor norm of A
 z2 = cnorm(A,'spec');     % Spectral tensor norm of A
 z3 = cnorm(A,'nuc');      % Nuclear tensor norm of A
 Ar = clowrank(A,3);       % Tensor solution for the low-tubal-rank ...
                           % ... approximation problem
 X5 = csvt(A,0.5);         % Tensor solution for the tensor singular value ...
                           % ... thresholding problem with tao=0.5
 A1 = rand(5,4,3);         % Third-order tensor generated ...
                           % ... randomly with uniform distribution
 B1 = rand(5,2,3);         % Third-order tensor generated ...
                           % ... randomly with uniform distribution
 C1 = rand(2,4,3);         % Third-order tensor generated ...
                           % ... randomly with uniform distribution
 X6 = clsq(A1,B1,C1);      % Tensor solution for the tensor least squares problem