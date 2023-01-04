% Preprocessing for NKI-children-breathhold data
% Frame-wise Displacement

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


%% Frame-wise Displacement

fd_max_trans = zeros(length(subj_list),1);fd_max_rotat = zeros(length(subj_list),1);
fd_mean_trans = zeros(length(subj_list),1);fd_mean_rotat = zeros(length(subj_list),1);
for subji = 1:length(subj_list)
    % Get func folder
    func_folder = [path 'sub-' subj_list{subji} '/ses-' session '/func/'];
    
    % Load .txt file from realignment step
    rp_func = load([func_folder 'prepro_breathhold/rp_sub-' subj_list{subji} '_ses-' session '_task-BREATHHOLD_acq-1400_bold.txt']);
    
    % Calculate translation and rotation
    rp_diff_trans = diff(rp_func(:,1:3));
    rp_diff_rotat = diff(rp_func(:,4:6)*180/pi);
    
    multp = rp_diff_trans*rp_diff_trans';
    fd_trans = sqrt(diag(multp));
    
    multp = rp_diff_rotat*rp_diff_rotat';
    fd_rotat = sqrt(diag(multp));
    
    fd_max_trans(subji,1) = max(fd_trans);
    fd_max_rotat(subji,1) = max(fd_rotat);
    
    fd_mean_trans(subji,1) = mean(fd_trans);
    fd_mean_rotat(subji,1) = mean(fd_rotat);
end

% Try less stringent threshold for children data:
excluded = find(fd_max_trans>2|fd_max_rotat>2|fd_mean_trans>0.3|fd_mean_rotat>0.3);
excludedID = subj_list(excluded);

save([path '/excluded_' session '_breathhold.mat'],'excludedID')

