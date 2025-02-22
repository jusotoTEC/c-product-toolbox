function numerical_experiment_3()

    % Numerical Experiment 3

    % Paper: C-Product Toolbox: A computational package for third-order tensor operations based on the reduced c-product
    % Authors: Soto-Quiros, Pablo, Valverde-Sanchez, Samuel and Chavarria-Zamora, Luis
    % Year: 2025
    % Status paper: Paper under submission

    clc; clear; close all
    
    disp('**** Numerical experiment 3: Applying the C-Product Toolbox for video denoising ****')  
    
    A = video2tensor('original_video.mp4');
    C = video2tensor('noisy_video.mp4');     
    [m,~,p]=size(A);
    B=ceye(m,p);
    X=clsq(A,B,C); %Compute Filter X
    A_rec=cprod(X,C); %Compute the denoised video
    label='denoised_video';
    tensor2video(A_rec,label)
    disp(['Done, the video ', label, '.mp4 is located in the folder ', pwd])
    
    %Show plot of # of frames vrs SSIM
    ssim_C=zeros(p,1);
    ssim_A_rec=zeros(p,1);
    for i=1:p
        ssim_C(i)=ssim(A(:,:,i),C(:,:,i));
        ssim_A_rec(i)=ssim(A(:,:,i),A_rec(:,:,i));
    end
    hold on
    grid
    plot(1:p,ssim_C,'r')
    plot(1:p,ssim_A_rec,'b')
    legend('Original Video with Noise', 'Video after Noise Removal')
    xlabel('Frame video (i)','FontSize',14)
    ylabel('SSIM','FontSize',14)
    set(gca, 'FontSize',14)    
    pbaspect([2 1 1]);
    xlim([1 p])
    ylim([0 1])
    
end

function A=video2tensor(path)
    % This function takes a video and converts it into a three-dimensional tensor
    video = VideoReader(path); 
    numFrames = floor(video.Duration * video.FrameRate);
    frameHeight = video.Height;
    frameWidth = video.Width;
    A = zeros(frameHeight, frameWidth, numFrames); 
    frameIndex = 1;
    
    while hasFrame(video)
        A(:,:,frameIndex) = rgb2gray(im2double(readFrame(video)));              
        frameIndex = frameIndex + 1;
    end
end

function tensor2video(A,label)
    % This function takes a three-dimensional tensor and converts it into a video
    video = VideoWriter(label, 'MPEG-4'); 
    open(video);
    numFrames=size(A,3);
    
    for i = 1:numFrames
        ith_frame = im2uint8(A(:,:,i)); 
        writeVideo(video, ith_frame); 
    end
    close(video);    
end
