% Preprocessing for NKI-children-breathhold data
% Removing noisy subjects according to framewise displacement results

clc; clear
path = '/mnt/disk1/NKI_Development_Data/longitudinal/child/all-visits/'; % Specify where subjects' data are
cd(path)


%% Remove noisy subjects from folder (from analyzing Framewise displacement values)

BAS1 = load([path 'excluded_BAS1_breathhold.mat']);
FLU1 = load([path 'excluded_FLU1_breathhold.mat']);
FLU2 = load([path 'excluded_FLU2_breathhold.mat']);

cd([path 'BAS1FLU1FLU2_bh_swr'])
sub_swr = dir('swr*');

for subji = 1:length(sub_swr)
    subName = sub_swr(subji).name;
    if sum(strcmp(subName(8:16),BAS1.excludedID))==1 && strcmp(subName(22:25),'BAS1')==1
        display(['excluding swrsub-' subName(8:16) '_ses-BAS1_task-BREATHHOLD_acq-1400_bold.nii'])
        delete(['swrsub-' subName(8:16) '_ses-BAS1_task-BREATHHOLD_acq-1400_bold.nii'])
    elseif sum(strcmp(subName(8:16),FLU1.excludedID))==1 && strcmp(subName(22:25),'FLU1')==1
        display(['excluding swrsub-' subName(8:16) '_ses-FLU1_task-BREATHHOLD_acq-1400_bold.nii'])
        delete(['swrsub-' subName(8:16) '_ses-FLU1_task-BREATHHOLD_acq-1400_bold.nii'])
    elseif sum(strcmp(subName(8:16),FLU2.excludedID))==1 && strcmp(subName(22:25),'FLU2')==1
        display(['excluding swrsub-' subName(8:16) '_ses-FLU2_task-BREATHHOLD_acq-1400_bold.nii'])
        delete(['swrsub-' subName(8:16) '_ses-FLU2_task-BREATHHOLD_acq-1400_bold.nii'])
    end
end
