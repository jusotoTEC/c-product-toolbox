function numerical_experiment_1()

    % Numerical Experiment 1

    % Paper: C-Product Toolbox: A new MATLAB toolbox for third-order tensor operations using the reduced c-product
    % Authors: Soto-Quiros, Pablo and Valverde-Sanchez, Samuel
    % Year: 2025
    % Status paper: Paper under submission
  
    clc; clear; close all

    disp('**** Numerical experiment 1:  Benchmarking memory usage of the reduced c-product, t-product and c-product ****')    
    bytes_rcp=[];  bytes_tp=[]; bytes_cp=[]; 
    dimTensor=500:100:1500;
    k=0; total=length(dimTensor);
    
    for m =dimTensor
        k=k+1;
        disp(['Simulation ', num2str(k), ' of ', num2str(total), ': Case m = ', num2str(m)])
        p=floor(m/10);
        A=rand(m,m/2,p); B=rand(m/2,m,p);
        info_bytes_rcp=reduced_c_product(A,B); bytes_rcp=[bytes_rcp info_bytes_rcp]; 
        info_bytes_tp=t_product(A,B); bytes_tp=[bytes_tp info_bytes_tp]; 
        info_bytes_cp=c_product(A,B); bytes_cp=[bytes_cp info_bytes_cp]; 
    end

    %Show graphic bar
    hold on
    grid on   
    bar(dimTensor, [bytes_rcp; bytes_tp; bytes_cp]')
    legend('reduced c-product', 't-product', 'c-product')    
    xlabel('Dimension (m)')
    ylabel('Used Memory (Bytes)')    

end

%The following 3 function (reduced_c_product, t_product and c_product), 
%compute the number of bytes used in each tensor product


function info_bytes=reduced_c_product(A,B)
    %The reduced c-product
    [m1,~,p1]=size(A); [~,n2,~]=size(B);        
    At = dct(A, [], 3);
    Bt = dct(B, [], 3);
    Ct = zeros(m1, n2, p1);
    for j = 1:p1
        Ct(:, :, j) = At(:, :, j)*Bt(:, :, j);        
    end
    C = idct(Ct, [], 3);  
    info_data = whos('A', 'B', 'C', 'At', 'Bt', 'Ct');
    info_bytes = sum([info_data.bytes]);
end

function info_bytes=t_product(A,B)
    %The t-product
    [m1,~,p1]=size(A); [~,n2,~]=size(B);        
    At = fft(A, [], 3);
    Bt = fft(B, [], 3);
    Ct = zeros(m1, n2, p1);
    halfp1 = ceil((p1+1)/2);
    for j = 1:halfp1
        Ct(:, :, j) = At(:, :, j)*Bt(:, :, j);        
    end    
    for i = halfp1+1 : p1
        Ct(:,:,i) = conj(Ct(:,:,p1+2-i));
    end
    C = ifft(Ct, [], 3);  
    info_data = whos('A', 'B', 'C', 'At', 'Bt', 'Ct');
    info_bytes = sum([info_data.bytes]);
end

function info_bytes=c_product(A,B)
    %The c-product
    [m1,~,p1]=size(A); [~,n2,~]=size(B);        
    [At,bytes_At] = dct_Full(A);
    [Bt,bytes_Bt] = dct_Full(B);
    Ct = zeros(m1, n2, p1);
    for j = 1:p1
        Ct(:, :, j) = At(:, :, j)*Bt(:, :, j);        
    end
    [C,bytes_C] = idct_Full(Ct); 
    info_data = whos('A', 'B', 'Ct');
    info_bytes = sum([info_data.bytes])+bytes_At+bytes_Bt+bytes_C;
end

function [B,info_bytes]=dct_Full(A)
    [m,n,p]=size(A);
    Cp = dctmtx(p);
    W = diag(Cp(:,1));
    Z = diag(ones(p-1,1),1);
    M = W\(Cp*(eye(p)+Z));
    A_rsh=reshape(A,[],p);
    B_rsh = A_rsh*M';
    B = reshape(B_rsh,m,n,p);
    info_data = whos('Cp', 'W', 'Z', 'M','A_rsh', 'B_rsh', 'B');
    info_bytes = sum([info_data.bytes]);
end

function [B,info_bytes]=idct_Full(A)
    [m,n,p]=size(A);
    Cp = dctmtx(p);
    W = diag(Cp(:,1));
    Z = diag(ones(p-1,1),1);
    M = W\(Cp*(eye(p)+Z));
    A_rsh=reshape(A,[],p);
    B_rsh = A_rsh/M';
    B = reshape(B_rsh,m,n,p);
    info_data = whos('Cp', 'W', 'Z', 'M','A_rsh', 'B_rsh', 'B');
    info_bytes = sum([info_data.bytes]);
end