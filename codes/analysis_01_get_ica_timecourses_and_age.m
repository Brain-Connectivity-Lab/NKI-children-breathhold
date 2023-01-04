% Get ICA timecourses (after performing ICA using the GIFT toolbox)

% All BAS1, FLU1, and FLU2 session scans

clear;clc

% Path where subject data are located
path = '/mnt/disk1/NKI_Development_Data/longitudinal/child/all-visits/';

% Path where subject ICA maps are located (specified from GIFT toolbox)
gift_path = '/mnt/disk1/NKI_Development_Data/longitudinal/child/all-visits/gift_ica_BAS1FLU1FLU2_bh_katana/';


%% Get final subject IDs. (Final meaning after excluding noisy subjects)

cd([path 'BAS1FLU1FLU2_bh_swr'])

swrFiles = dir('sub*');
finalNames = {swrFiles.name}';


%% Get mean ICA timecourses for each subject

cd(gift_path)

timecourse_all = cell(1,length(finalNames));
for subji = 1:length(finalNames)
    loadIC = load(['ica_ica_c' num2str(subji) '-1.mat']); % prefix 'ica' specified in GIFT
    timecourse_all{subji} = loadIC.tc;
end


%% Get ages of subjects at each session (BAS1, FLU1, FLU2)

cd(path)
ages = cell(length(finalNames),1);
for subji = 1:length(finalNames)
    sub = finalNames{subji};
    subID = sub(1:13);
    session = sub(15:end);
    subInfo = tdfread([path subID '/' subID '_sessions.tsv']); % tsv file contains age
    
    % All sessions the subject participated in
    subSession = subInfo.session;
    
    % Find at which index session=subSession, and then use that index to get the age
    idxAge = all(ismember(subSession, session(5:end)),2);
    
    if isa(subInfo.age(idxAge),'double')==1
        ages{subji} = subInfo.age(idxAge);
    else
        ages{subji} = str2double(subInfo.age(idxAge,:));
    end
end


%% Sort by age (youngest to oldest)

% Subj#70 has the number 13 entered twice - need to change that
ages{70} = 13;

agesMat = cell2mat(ages);

[agesSort, idxAges] = sort(agesMat);

timecourse_all_sort = {timecourse_all{idxAges}};

% Get the final names, now sorted by age
finalNamesSort = finalNames(idxAges);


%% Save the variables

cd(path)
save('nki_bh_ica_bas1flu1flu2.mat','ages','agesSort','finalNames','finalNamesSort','idxAges','timecourse_all','timecourse_all_sort')


