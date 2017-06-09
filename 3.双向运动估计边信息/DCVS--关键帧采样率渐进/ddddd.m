function ddddd(SeqName, NF, GOPSize, MKP, MCSP, FrameWidth, FrameHeight, Iteration)
Ave_PSNR = 0.0;
Ave_K_PSNR = 0.0;
Ave_CS_PSNR = 0.0;
Ave_num_nz_theta = 0.0;
Ave_num_iteration = 0.0;
KFN = 0;
CSFN = 0;
MK = MKP * FrameWidth * FrameHeight;
MCS = MCSP * FrameWidth * FrameHeight;

tic; % start time

for fn = 1: NF
  
        imgfile = sprintf('%s_00000%d.bmp', SeqName, fn - 1);
        Recimgfile = sprintf('Rec%s00%d.bmp', SeqName, fn - 1);
       
                
        [Rec_K, K_PSNR, num_nz_theta, Num_Iteration] = fast_cs2d(imgfile, MK, 'BWHT', 0, 32, Iteration);
        Ave_PSNR = Ave_PSNR + K_PSNR;
        Ave_K_PSNR = Ave_K_PSNR + K_PSNR;
        Ave_num_nz_theta = Ave_num_nz_theta + num_nz_theta;
        Ave_num_iteration = Ave_num_iteration + Num_Iteration;
        imwrite(Rec_K, Recimgfile, 'bmp');
        KFN = KFN + 1;
    end
end
