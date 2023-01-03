% Preprocessing for NKI-children-breathhold data
% Coregistration

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


%% Coregistration

clear matlabbatch batch

batch = cell(1,length(subj_list));
for subji = 1:length(subj_list)
    % Define functional and anatomical folders
    func_folder = [path 'sub-' subj_list{subji} '/ses-' session '/func/']; 
    anat_folder = [path 'sub-' subj_list{subji} '/ses-' session '/anat/'];
    
    % Source image (moves around)
    mean_func_image = ([func_folder 'prepro_breathhold/meansub-' subj_list{subji} '_ses-' session '_task-BREATHHOLD_acq-1400_bold.nii']);
    
    % Reference image (stationary)
    anat_image = ([anat_folder 'prepro_breathhold/ss_sub-' subj_list{subji} '_ses-' session '_T1w.nii,1']);
    
    % SPM Coregistration Parameters 
    matlabbatch{1}.spm.spatial.coreg.estimate.ref = {anat_image};
    matlabbatch{1}.spm.spatial.coreg.estimate.source = {mean_func_image};
    
    % Other images to coregister (realigned functional images 
    % Get the number of timepoints, t (# of frames)
    vol_rest = spm_vol([func_folder 'prepro_breathhold/sub-' subj_list{subji} '_ses-' session '_task-BREATHHOLD_acq-1400_bold.nii']); 
    [t,~]=size(vol_rest); 
    for imagei = 1:t
        matlabbatch{1}.spm.spatial.coreg.estimate.other{imagei,1} = [path 'sub-' subj_list{subji} '/ses-' session '/func/prepro_breathhold/rsub-' subj_list{subji} '_ses-' session '_task-BREATHHOLD_acq-1400_bold.nii,' num2str(imagei)];
    end
        
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
    
    batch{subji} = matlabbatch;
end

parfor (subji = 1:length(subj_list), 6)
    spm_jobman('run', batch{subji})
end 
