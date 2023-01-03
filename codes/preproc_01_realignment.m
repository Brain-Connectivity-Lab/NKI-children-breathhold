% Preprocessing for NKI-children-breathhold data
% Realignment

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


%% Realignment

batch = cell(1,length(subj_list));
for subji = 1:length(subj_list)
    % Define func folders
    func_folder = [path 'sub-' subj_list{subji} '/ses-' session '/func/']; 
    
    % Get the number of timepoints, t (# of frames)
    vol_rest = spm_vol([func_folder 'prepro_breathhold/sub-' subj_list{subji} '_ses-' session '_task-BREATHHOLD_acq-1400_bold.nii']); 
    [t,~]=size(vol_rest); 
    
    % Loop through all timepoints
    func_images = cell(t, 1);
    for imagei = 1:t
        func_images{imagei, 1} = ([func_folder 'prepro_breathhold/sub-' subj_list{subji} '_ses-' session '_task-BREATHHOLD_acq-1400_bold.nii,' num2str(imagei)]);
    end
    
    % SPM Realignment Parameters
    matlabbatch{1}.spm.spatial.realign.estwrite.data = {func_images};
    matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
    matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.sep = 4;
    matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
    matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
    matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.interp = 2;
    matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
    matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.weight = '';
    matlabbatch{1}.spm.spatial.realign.estwrite.roptions.which = [2 1];
    matlabbatch{1}.spm.spatial.realign.estwrite.roptions.interp = 4;
    matlabbatch{1}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
    matlabbatch{1}.spm.spatial.realign.estwrite.roptions.mask = 1;
    matlabbatch{1}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
    batch{subji} = matlabbatch;
end

% Using parallel pool (need Matlab Parallel Computing Toolbox)
parfor (subji = 1:length(subj_list), 6)  
    spm_jobman('run', batch{subji});
end

