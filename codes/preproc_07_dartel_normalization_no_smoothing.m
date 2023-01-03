% Preprocessing for NKI-children-breathhold data
% Dartel Normalization with No Smoothing

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


%% Dartel - Normalize only (no smoothing) 
% No smoothing used to create a mask later on

matlabbatch{1}.spm.tools.dartel.mni_norm.template = {[path 'sub-' subj_list{1} '/ses-' session '/anat/prepro_breathhold/Template_6.nii']};

for subji = 1:length(subj_list)
    % Define folders with functional image
    func_folder = [path 'sub-' subj_list{subji} '/ses-' session '/func/'];
    
    matlabbatch{1}.spm.tools.dartel.mni_norm.data.subj(subji).flowfield = {[path 'sub-' subj_list{subji} '/ses-' session '/anat/prepro_breathhold/u_rc1sub-' subj_list{subji} '_ses-' session '_T1w_Template.nii']};
    matlabbatch{1}.spm.tools.dartel.mni_norm.data.subj(subji).images = {[path 'sub-' subj_list{subji} '/ses-' session '/func/prepro_breathhold/rsub-' subj_list{subji} '_ses-' session '_task-BREATHHOLD_acq-1400_bold.nii']};
end
                                                 
matlabbatch{1}.spm.tools.dartel.mni_norm.vox = [3 3 3];
matlabbatch{1}.spm.tools.dartel.mni_norm.bb = [-90 -126 -72
    90 90 108];
matlabbatch{1}.spm.tools.dartel.mni_norm.preserve = 0;
matlabbatch{1}.spm.tools.dartel.mni_norm.fwhm = [0 0 0]; % No Smoothing - outputs wr- files -> to create a mask

spm_jobman('run',matlabbatch)
