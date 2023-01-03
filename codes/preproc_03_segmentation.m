% Preprocessing for NKI-children-breathhold data
% Segmentation

clc; clear
path = '/mnt/disk1/NKI_Development_Data/longitudinal/child/all-visits/'; % Specify where subjects' data are

% Load subject names to preprocess
load('../data/finalAllSubjID.mat')
cd(path)

% Specify session ('BAS1','FLU1', or 'FLU2')
session = 'BAS1';

switch session
    case 'BAS1'
        subj_list = subB1T1BHa18HC;
    case 'FLU1'
        subj_list = subF1T1BHa18HC;
    case 'FLU2'
        subj_list = subF2T1BHa18HC;
end


%% Segmentation

batch = cell(1,length(subj_list));
for subji = 1:length(subj_list)
    % Define anatomical folders
    anat_folder = [path 'sub-' subj_list{subji} '/ses-' session '/anat/'];
    
    % Anatomical image
    anat_image = ([anat_folder '/prepro_breathhold/sub-' subj_list{subji} '_ses-' session '_T1w.nii']);
    
    % SPM Segmentation Parameters
    matlabbatch{1}.spm.spatial.preproc.channel.vols = {anat_image};
    matlabbatch{1}.spm.spatial.preproc.channel.biasreg = 0.001;
    matlabbatch{1}.spm.spatial.preproc.channel.biasfwhm = 60;
    matlabbatch{1}.spm.spatial.preproc.channel.write = [0 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(1).tpm = {'/home/biswal/Documents/MATLAB/spm12/tpm/TPM.nii,1'};
    matlabbatch{1}.spm.spatial.preproc.tissue(1).ngaus = 1;
    matlabbatch{1}.spm.spatial.preproc.tissue(1).native = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(1).warped = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(2).tpm = {'/home/biswal/Documents/MATLAB/spm12/tpm/TPM.nii,2'};
    matlabbatch{1}.spm.spatial.preproc.tissue(2).ngaus = 1;
    matlabbatch{1}.spm.spatial.preproc.tissue(2).native = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(2).warped = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(3).tpm = {'/home/biswal/Documents/MATLAB/spm12/tpm/TPM.nii,3'};
    matlabbatch{1}.spm.spatial.preproc.tissue(3).ngaus = 2;
    matlabbatch{1}.spm.spatial.preproc.tissue(3).native = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(3).warped = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(4).tpm = {'/home/biswal/Documents/MATLAB/spm12/tpm/TPM.nii,4'};
    matlabbatch{1}.spm.spatial.preproc.tissue(4).ngaus = 3;
    matlabbatch{1}.spm.spatial.preproc.tissue(4).native = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(4).warped = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(5).tpm = {'/home/biswal/Documents/MATLAB/spm12/tpm/TPM.nii,5'};
    matlabbatch{1}.spm.spatial.preproc.tissue(5).ngaus = 4;
    matlabbatch{1}.spm.spatial.preproc.tissue(5).native = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(5).warped = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(6).tpm = {'/home/biswal/Documents/MATLAB/spm12/tpm/TPM.nii,6'};
    matlabbatch{1}.spm.spatial.preproc.tissue(6).ngaus = 2;
    matlabbatch{1}.spm.spatial.preproc.tissue(6).native = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(6).warped = [1 1];
    matlabbatch{1}.spm.spatial.preproc.warp.mrf = 1;
    matlabbatch{1}.spm.spatial.preproc.warp.cleanup = 1;
    matlabbatch{1}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
    matlabbatch{1}.spm.spatial.preproc.warp.affreg = 'mni';
    matlabbatch{1}.spm.spatial.preproc.warp.fwhm = 0;
    matlabbatch{1}.spm.spatial.preproc.warp.samp = 3;
    matlabbatch{1}.spm.spatial.preproc.warp.write = [1 1];
    matlabbatch{1}.spm.spatial.preproc.warp.vox = NaN;
    matlabbatch{1}.spm.spatial.preproc.warp.bb = [NaN NaN NaN
                                                  NaN NaN NaN];
    
    batch{subji} = matlabbatch;
end

parfor (subji = 1:length(subj_list),6)
    spm_jobman('run', batch{subji})
end

