% Preprocessing for NKI-children-breathhold data
% Skull Stripping

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


%% Skull Stripping

batch = cell(1,length(subj_list));
for subji = 1:length(subj_list)
    matlabbatch{1}.spm.util.imcalc.input{1,1} = [path 'sub-' subj_list{subji} '/ses-' session '/anat/prepro_breathhold/sub-' subj_list{subji} '_ses-' session '_T1w.nii,1'];
    matlabbatch{1}.spm.util.imcalc.input{2,1} = [path 'sub-' subj_list{subji} '/ses-' session '/anat/prepro_breathhold/c1sub-' subj_list{subji} '_ses-' session '_T1w.nii,1'];
    matlabbatch{1}.spm.util.imcalc.input{3,1} = [path 'sub-' subj_list{subji} '/ses-' session '/anat/prepro_breathhold/c2sub-' subj_list{subji} '_ses-' session '_T1w.nii,1'];
    matlabbatch{1}.spm.util.imcalc.input{4,1} = [path 'sub-' subj_list{subji} '/ses-' session '/anat/prepro_breathhold/c3sub-' subj_list{subji} '_ses-' session '_T1w.nii,1'];
    matlabbatch{1}.spm.util.imcalc.output = ['ss_' 'sub-' subj_list{subji} '_ses-' session '_T1w'];
    matlabbatch{1}.spm.util.imcalc.outdir = {[path 'sub-' subj_list{subji} '/ses-' session '/anat/prepro_breathhold/']};
    matlabbatch{1}.spm.util.imcalc.expression = 'i1.*((i2+i3+i4)>0.5)';
    matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{1}.spm.util.imcalc.options.mask = 0;
    matlabbatch{1}.spm.util.imcalc.options.interp = 1;
    matlabbatch{1}.spm.util.imcalc.options.dtype = 4;
    
    batch{subji} = matlabbatch;
end

parfor (subji = 1:length(subj_list),6)
    spm_jobman('run', batch{subji})
end
