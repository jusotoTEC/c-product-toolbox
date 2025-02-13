function test_toolbox()

    % Numerical Examples
    % Paper: C-Product Toolbox: A new MATLAB toolbox for third-order tensor operations using the reduced c-product
    % Authors: Soto-Quiros, Pablo and Valverde-Sanchez, Samuel
    % Year: 2025
    % Status paper: Paper under submission      
    
    %The variable 'opt' allows selecting the numerical example
    %Alternatives for variable 'opt':
    %   opt = 1  : cprod
    %   opt = 2  : cinprod
    %   opt = 3  : ceye
    %   opt = 4  : ctransp
    %   opt = 5  : csvd
    %   opt = 6  : cqr
    %   opt = 7  : csqrtt
    %   opt = 8  : ctubalrank
    %   opt = 9  : cmultirank
    %   opt = 10 : cinv
    %   opt = 11 : cpinv
    %   opt = 12 : cdrazin
    %   opt = 13 : cnorm
    %   opt = 14 : clowrank
    %   opt = 15 : csvt
    %   opt = 16 : clsq
    
    clc; clear; close all
    
    %Vatiable 'opt'
    opt = 15;    
    switch opt
        case 1 
            disp('Example 1: ''cprod'' command')
            A=zeros(2,2,3); B=zeros(2,2,3); 
            A(:,:,1)=[-2 0;1 0]; A(:,:,2)=[2 1;1 2]; A(:,:,3)=[3 -2;0 -1];
            B(:,:,1)=[2 -1;0 0]; B(:,:,2)=[-1 -3;0 2]; B(:,:,3)=[1 2;-1 -1];
            disp('Result:')
            C=cprod(A,B)                              
        case 2
            disp('Example 2: ''cinprod'' command')
            A=zeros(2,2,3); B=zeros(2,2,3); 
            A(:,:,1)=[-2 0;1 0]; A(:,:,2)=[2 1;1 2]; A(:,:,3)=[3 -2;0 -1];
            B(:,:,1)=[2 -1;0 0]; B(:,:,2)=[-1 -3;0 2]; B(:,:,3)=[1 2;-1 -1];
            disp('Result:')
            C=cinprod(A,B)                    
        case 3
            disp('Example 3: ''ceye'' command')
            disp('Result:')
            I=ceye(2,2)            
        case 4
            disp('Example 4: ''ctransp'' command')
            A=zeros(2,3,2);
            A(:,:,1)=[1 -1 -2;-2 3 1]; A(:,:,2)=[-2 3 1;1 0 -1];
            disp('Result:')
            C=ctransp(A)       
        case 5
            disp('Example 5: ''csvd'' command')
            A=zeros(2,3,2);
            A(:,:,1)=[1 -1 -2;-2 3 1]; A(:,:,2)=[-2 3 1;1 0 -1];
            disp('Result:')
            [U,S,V]=csvd(A)            
        case 6
            disp('Example 6: ''cqr'' command')
            A=zeros(2,3,2);
            A(:,:,1)=[1 -1 -2;-2 3 1]; A(:,:,2)=[-2 3 1;1 0 -1];
            disp('Result:')
            [Q,R]=cqr(A)            
        case 7
            disp('Example 7: ''csqrtt'' command')
            A=zeros(2,2,3);
            A(:,:,1)=[6.989 1.711; 1.711 7.855];
            A(:,:,2)=[-4.222 0.676; 0.676 3.802];
            A(:,:,3)=[4.161 4.540; 4.540 2.198];
            disp('Result:')
            B=csqrtt(A)
        case 8
            disp('Example 8: ''ctubalrank'' command')
            B=zeros(2,1,3); C=zeros(1,3,3);
            B(:,:,1)=[1; -1]; B(:,:,2)=[1; 1]; B(:,:,3)=[1; 0]; 
            C(:,:,1)=[-2 -1 2]; C(:,:,2)=[-2 2 0]; C(:,:,3)=[2 -2 0];   
            A=cprod(B,C);
            disp('Result:')
            r=ctubalrank(A)
        case 9
            disp('Example 9: ''cmultirank'' command')
            B=zeros(2,1,3); C=zeros(1,3,3);    
            B(:,:,1)=[1; -1]; B(:,:,2)=[1 1]; B(:,:,3)=[1; 0]; 
            C(:,:,1)=[-2 -1 2]; C(:,:,2)=[-2 2 0]; C(:,:,3)=[2 -2 0];
            A=cprod(B,C);       
            disp('Result:')
            r=cmultirank(A) 
        case 10
            disp('Example 10: ''cinv'' command')
            A=zeros(2, 2, 2);
            A(:,:,1)=[1 -1;0 -1]; A(:,:,2)=[0 2;-1 -2]; 
            disp('Result:')
            B=cinv(A)  
        case 11
            disp('Example 11: ''cpinv'' command')
            A=zeros(2,3,2); 
            A(:,:,1)=[1 -1 -2;-2 3 1]; A(:,:,2)=[-2 3 1;1 0 -1];
            disp('Result:')
            B=cpinv(A)
        case 12
            disp('Example 12: ''cdrazin'' command')
            A=zeros(3,3,3);
            A(:,:,1)=[4 -4 -1;-7 -8 7;-1 -2 0]; 
            A(:,:,2)=[-2 2 1;4 4 -4;0 1 0];
            A(:,:,3)=[-1 2 0;3 4 -2;1 1 0];             
            disp('Result:')
            [X,t]=cdrazin(A)
        case 13
            disp('Example 13: ''cnorm'' command')
            A=zeros(2,3,2); 
            A(:,:,1)=[1 -1 -2;-2 3 1]; A(:,:,2)=[-2 3 1;1 0 -1];
            disp('Result:')
            n1=cnorm(A);
            n2=cnorm(A,'spec');
            n3=cnorm(A,'nuc');
            disp(['Frobenius norm = ', num2str(n1)])
            disp(['Spectarl norm = ', num2str(n2)])
            disp(['Nuclear norm = ', num2str(n3)])            
        case 14
            disp('Example 14: ''clowrank'' command')
            A=zeros(2,3,2); 
            A(:,:,1)=[1 -1 -2;-2 3 1]; A(:,:,2)=[-2 3 1;1 0 -1];
            r=1;
            disp('Result:')
            Ar=clowrank(A,r)
        case 15
            disp('Example 15: ''csvt'' command')
            A=zeros(2,3,2); 
            A(:,:,1)=[1 -1 -2;-2 3 1]; A(:,:,2)=[-2 3 1;1 0 -1];
            t=0.5;            
            disp('Result:')
            Ar=csvt(A,t)
        case 16
            disp('Example 15: ''csvt'' command')
            A=zeros(2,3,2); B=zeros(2,2,2); C=zeros(1,3,2);
            A(:,:,1)=[1 -1 -1;0 -2 -3]; A(:,:,2)=[-2 2 1;1 0 -1];
            B(:,:,1)=[1 0;0 1]; B(:,:,2)=[0 3;2 0]; 
            C(:,:,1)=[0 -2 1]; C(:,:,2)=[1 -1 1]; 
            disp('Result:')
            X=clsq(A,B,C)
    end

end