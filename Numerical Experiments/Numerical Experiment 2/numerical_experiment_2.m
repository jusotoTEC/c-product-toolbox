function numerical_experiment_2()

    % Numerical Experiment 2

    % Paper: C-Product Toolbox: A new MATLAB toolbox for third-order tensor operations using the reduced c-product
    % Authors: Soto-Quiros, Pablo and Valverde-Sanchez, Samuel
    % Year: 2025
    % Status paper: Paper under submission

    clc; clear; close all
    
    disp('**** Numerical experiment 2: Execution time comparison of the proposed C-Product Toolbox and the Tensor-Tensor Product Toolbox 2.0 ****')    
    
    %The variable 'opt allows selecting which functions to compare.
    %Alternatives for variable 'opt':
    %   opt = 1 : cprod vrs tprod
    %   opt = 2 : csvd vrs tsvd
    %   opt = 3 : cqr vrs tqr
    %   opt = 4 : cinv vrs tinv
    %   opt = 5 : cnorm( . ,'nuc') vrs tnn
    %   opt = 6 : cnorm( . ,'spec') vrs tsn
    %   opt = 7 : ctubalrank vrs tubalrank
    %   opt = 8 : csvt vrs prox_tnn
    
    %Vatiable 'opt'
    opt = 1;
    
    time_c=[]; time_t=[]; 
    
    switch opt
        case 1 
            disp('**** Experiment: cprod vrs tprod ****')
            dimTensor=500:125:2000; 
            k=0; total=length(dimTensor);
            for m=dimTensor   
                k=k+1;
                disp(['Simulation ', num2str(k), ' of ', num2str(total), ': Case m = ', num2str(m)])
                n=floor(m/4); s=floor(m/3); p=floor(m/5);
                A=rand(m,n,p); B=rand(n,s,p);                
                tic; C1=cprod(A,B); t1=toc; time_c=[time_c t1];    
                tic; C2=tprod(A,B); t2=toc; time_t=[time_t t2];
            end    
            label_c='cprod';
            label_t='tprod';            
        case 2 
            disp('**** Experiment: csvd vrs tsvd ****')
            dimTensor=500:125:1750;            
            k=0; total=length(dimTensor);
            for m=dimTensor   
                k=k+1;
                disp(['Simulation ', num2str(k), ' of ', num2str(total), ': Case m = ', num2str(m)])
                n=floor(m/4); p=floor(m/8); 
                A=rand(m,n,p);                 
                tic; [U1,S1,V1]=csvd(A); t1=toc; time_c=[time_c t1];    
                tic; [U2,S2,V2]=tsvd(A); t2=toc; time_t=[time_t t2];                
            end
            label_c='csvd';
            label_t='tsvd';            
        case 3 
            disp('**** Experiment: cqr vrs tqr ****')
            dimTensor=500:125:1875; 
            k=0; total=length(dimTensor);
            for m=dimTensor   
                k=k+1;
                disp(['Simulation ', num2str(k), ' of ', num2str(total), ': Case m = ', num2str(m)])
                n=floor(m/5); p=floor(m/10); 
                A=rand(m,n,p);                 
                tic; [Q1,R1]=cqr(A); t1=toc; time_c=[time_c t1];    
                tic; [Q2,R2]=tqr(A); t2=toc; time_t=[time_t t2];               
            end
            label_c='cqr';
            label_t='tqr';
        case 4 
            disp('**** Experiment: cinv vrs tinv ****')
            dimTensor=500:125:2000; 
            k=0; total=length(dimTensor);
            for m=dimTensor   
                k=k+1;
                disp(['Simulation ', num2str(k), ' of ', num2str(total), ': Case m = ', num2str(m)])
                p=floor(m/20); 
                A=rand(m,m,p);                 
                tic; B1=cinv(A); t1=toc; time_c=[time_c t1];    
                tic; B2=tinv(A); t2=toc; time_t=[time_t t2];                
            end    
            label_c='cinv';
            label_t='tinv';
        case 5 
            disp('**** Experiment: cnorm( . ,''nuc'') vrs tnn ****')
            dimTensor=500:125:4000;  
            k=0; total=length(dimTensor);
            for m=dimTensor   
                k=k+1;
                disp(['Simulation ', num2str(k), ' of ', num2str(total), ': Case m = ', num2str(m)])
                n=floor(m/50); p=floor(m/5);  
                A=rand(m,n,p);                 
                tic; n1=cnorm(A,'nuc'); t1=toc; time_c=[time_c t1];    
                tic; n2=tnn(A); t2=toc; time_t=[time_t t2];
            end  
            label_c='cnorm( . ,''nuc'')';
            label_t='tnn';            
         case 6
            disp('**** Experiment: cnorm( . ,''spec'') vrs tsn ****')
            dimTensor=500:125:4000; 
            k=0; total=length(dimTensor);
            for m=dimTensor   
                k=k+1;
                disp(['Simulation ', num2str(k), ' of ', num2str(total), ': Case m = ', num2str(m)])
                n=floor(m/50); p=floor(m/5); 
                A=rand(m,n,p);                 
                tic; n1=cnorm(A,'spec'); t1=toc; time_c=[time_c t1];    
                tic; n2=tsn(A); t2=toc; time_t=[time_t t2];             
            end 
            label_c='cnorm( . ,''spec'')';
            label_t='tsn';              
         case 7
            disp('**** Experiment: ctubalrank vrs tubalrank ****')
            dimTensor=500:125:5000;   
            k=0; total=length(dimTensor);
            for m=dimTensor   
                k=k+1;
                disp(['Simulation ', num2str(k), ' of ', num2str(total), ': Case m = ', num2str(m)])
                n=floor(m/50); p=floor(m/20); 
                A=rand(m,n,p);                 
                tic; n1=ctubalrank(A); t1=toc; time_c=[time_c t1];    
                tic; n2=tubalrank(A); t2=toc; time_t=[time_t t2];
            end     
            label_c='ctubalrank';
            label_t='tubalrank';            
         case 8
            disp('**** Experiment: csvt vrs prox_tnn ****')
            dimTensor=500:125:3000;   
            k=0; total=length(dimTensor);
            for m=dimTensor   
                k=k+1;
                disp(['Simulation ', num2str(k), ' of ', num2str(total), ': Case m = ', num2str(m)])               
                n=floor(m/30); p=floor(m/5); 
                A=rand(m,n,p);                 
                t=0.5;
                tic; X1=csvt(A,t); t1=toc; time_c=[time_c t1];    
                tic; X2=prox_tnn(A,t); t2=toc; time_t=[time_t t2];
            end              
            label_c='csvt';
            label_t='prox_tnn';            
    end  

    %Plot of results
    
    %Dimension vrs Time
    figure
    hold on 
    grid on       
    plot(dimTensor,time_c,'b')
    plot(dimTensor,time_t,'r')  
    xlabel('Dimension (m)','FontSize',14)
    ylabel('Time (s)','FontSize',14)   
    set(gca, 'FontSize',14)
    legend(label_c,label_t)
    axis tight;  
    pbaspect([2 1 1]);  
    
    %Dimension vrs Speedup
    S=time_t./time_c;    
    figure
    hold on 
    grid on       
    plot(dimTensor,S,'b')
    xlabel('Dimension (m)','FontSize',14)
    ylabel('Speedup (S)','FontSize',14)
    set(gca, 'FontSize',14)    
    axis tight;  
    pbaspect([2 1 1]);  
    
    %Dimension vrs Percent Diference
    P=100*((time_t - time_c)./time_t);
    figure
    hold on 
    grid on       
    plot(dimTensor,P,'b')  
    xlabel('Dimension (m)','FontSize',14)
    ylabel('Percent Difference (%)','FontSize',14)
    set(gca, 'FontSize',14)
    axis tight;  
    pbaspect([2 1 1]);  
end