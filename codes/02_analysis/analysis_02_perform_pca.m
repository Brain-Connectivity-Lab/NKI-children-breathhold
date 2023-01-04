% NKI Longitudinal Child Data - Perform PCA on networks
% Breath-hold response, 18s

clear;clc
load('nki_bh_ica_bas1flu1flu2.mat')


%% We are only interested in the meaningful IC networks
% Visually inspected all of the IC maps using GIFT toolbox
keepIC = [1,2,3,4,8,9,11,15,16,17,21,25];
keepICname = ["Posterior DMN","Cingulo-opercular","Sensorimotor","Left Frontoparietal","Anterior DMN","Salience","Lateral Visual","Medial Visual","Auditory","Frontal Pole","Somatosensory","Right Frontoparietal"];


%% 2D Maps sorted by age (combining all sessions together - BAS1, FLU1, and FLU2)

% We want to reshape the timecourse_all_sort variable to 155 subjects by
% 186 timepoints, for each IC network (25). The timecourse_all_sort
% variable is sorted by age.

timecourse_all_sort_rs = cell(1,25);
numSubj = 155;
tc = cell(1,numSubj);
for ic = 1:25
    for subji = 1:numSubj
        tc{subji} = timecourse_all_sort{subji}(:,ic);
    end
    timecourse_all_sort_rs{1,ic} = [tc{:}]';
end

% Visualizing data
fig = figure();
for ic = 1:length(keepIC)
    subplot(3,4,ic)
    imagesc(timecourse_all_sort_rs{keepIC(ic)});
    title(keepICname(ic))
    sgtitle('Subjects Sorted by Ascending Age (6 to 17)')
end
han = axes(fig,'visible','off');
han.YLabel.Visible = 'on';
han.XLabel.Visible = 'on';
ylabel(han,'Subject #')
xlabel(han,'Timepoint')


%% Perform principal components analysis (PCA)
% Uses SVD algorithm. We want to do pca([timepoints x subjects])
% Perform PCA on all session data aggregated (BAS1, FLU1, FLU2)

% PCA on each IC network of interest
coeff = cell(1,length(keepIC)); score = cell(1,length(keepIC));
percent_explained = cell(1,length(keepIC));
for ic = 1:length(keepIC)
    [coeff{ic},score{ic},~,~,percent_explained{ic}] = pca(timecourse_all_sort_rs{keepIC(ic)}');
end


%% Find the sex of each participant

demographic = readtable('NKI_subjects_shortened.xlsx');
% dem_002 = Sex info. Male = 1, Female = 2.

sex = zeros(length(finalNames),1);
for i = 1:length(finalNamesSort)
    subID_all = finalNamesSort{i}(5:13); % Don't need 'sub-' part of name
    
    subID_ses = [subID_all ',' finalNamesSort{i}(end-3:end)]; % Add session
   
    subID_idx = find(string(demographic.Identifiers) == subID_ses);
    
    sex(i) = demographic.dem_002(subID_idx);
end


%% Creating a table to save results in

charFinalNamesSort = char(finalNamesSort);
charSubID = charFinalNamesSort(:,[1:13]);
subID = nominal(charSubID);
subID = repmat(subID,12,1);

session = charFinalNamesSort(:,[19:end]);
session = nominal(session);
session = repmat(session,12,1);

ICnames = repmat(keepICname,numSubj,1);

sexRep = repmat(sex,12,1); %1=M, 2=F

% Age
agesSortRep = repmat(agesSort,12,1); % repmat here b/c we have 12 ICs (want to repeat for each IC)

% Re-formatting the PC1 Loadings
coeff_pc1 = cell(1,length(keepIC));
for ic = 1:length(coeff)
    coeff_pc1{ic} = coeff{ic}(:,1);
end
coeff_pc1 = cell2mat(coeff_pc1');

% Creating a table
tbl = table(subID,agesSortRep,sexRep,ICnames(:),session,coeff_pc1,'VariableNames',{'SubID','Age','Sex','ICnetwork','Session','PC1Loading'});

% Saving the table 
writetable(tbl,'table_lme_bas1flu1flu2.csv')

