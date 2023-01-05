# NKI Child Longitudinal Data
# Performing Mixed Effects Modeling to compare trends across age in the breath-hold response.

setwd("C:/Users/chend/Desktop/Research/NKI_Development")

tbl <- read.csv("table_lme_bas1flu1flu2.csv")

library(lmerTest) # Mixed model package by Douglas Bates, comes w/ pvalues
library(texreg) # Helps make tables of the mixed models
library(afex) # Easy ANOVA package to compare model fits
library(ggplot2) # GGplot package for visualizing data
library(lme4)


# Fixed effect: Age
# Random effect: Subject 

# LME Model for Anterior DMN ----------------------------------------------

# LME model: PC1Loading ~ Age + (1|Subject) # random intercept-only model 
lmerADMN <- lmer(PC1Loading ~ Age + (1|SubID), data = subset(tbl, ICnetwork=="Anterior DMN"), REML=F)
summary(lmerADMN)

# Quadratic Term: PC1Loading ~ Age^2 + (1|Subject)
lmerADMN_quad <- lmer(PC1Loading ~ I(Age^2) + Age + (1|SubID), data = subset(tbl, ICnetwork=="Anterior DMN"), REML=F)
summary(lmerADMN_quad)

# Logarithmic Term: PC1Loading ~ log(Age) + (1|Subject)
lmerADMN_log <- lmer(PC1Loading ~ log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Anterior DMN"), REML=F)
summary(lmerADMN_log)

# Quadratic-log Term: PC1Loading ~ log(Age)^2 + log(Age) + (1|Subject)
lmerADMN_quadlog <- lmer(PC1Loading ~ I(log(Age)^2) + log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Anterior DMN"), REML=F)
summary(lmerADMN_quadlog)


# LME Model for Auditory Network -----------------------------------------

# LME model: PC1Loading ~ Age + (1|Subject) # random intercept-only model 
lmerAud <- lmer(PC1Loading ~ Age + (1|SubID), data = subset(tbl, ICnetwork=="Auditory"), REML=F)
summary(lmerAud)

# Quadratic Term: PC1Loading ~ Age^2 + (1|Subject)
lmerAud_quad <- lmer(PC1Loading ~ I(Age^2) + Age + (1|SubID), data = subset(tbl, ICnetwork=="Auditory"), REML=F)
summary(lmerAud_quad)

# Logarithmic Term: PC1Loading ~ log(Age) + (1|Subject)
lmerAud_log <- lmer(PC1Loading ~ log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Auditory"), REML=F)
summary(lmerAud_log)

# Quadratic-log Term: PC1Loading ~ log(Age)^2 + log(Age) + (1|Subject)
lmerAud_quadlog <- lmer(PC1Loading ~ I(log(Age)^2) + log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Auditory"), REML=F)
summary(lmerAud_quadlog)


# LME Model for Cingulo-opercular Network ---------------------------------

# LME model: PC1Loading ~ Age + (1|Subject) # random intercept-only model 
lmerCO <- lmer(PC1Loading ~ Age + (1|SubID), data = subset(tbl, ICnetwork=="Cingulo-opercular"), REML=F)
summary(lmerCO)

# Quadratic Term: PC1Loading ~ Age^2 + (1|Subject)
lmerCO_quad <- lmer(PC1Loading ~ I(Age^2) + Age + (1|SubID), data = subset(tbl, ICnetwork=="Cingulo-opercular"), REML=F)
summary(lmerCO_quad)

# Logarithmic Term: PC1Loading ~ log(Age) + (1|Subject)
lmerCO_log <- lmer(PC1Loading ~ log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Cingulo-opercular"), REML=F)
summary(lmerCO_log)

# Quadratic-log Term: PC1Loading ~ log(Age)^2 + log(Age) + (1|Subject)
lmerCO_quadlog <- lmer(PC1Loading ~ I(log(Age)^2) + log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Cingulo-opercular"), REML=F)
summary(lmerCO_quadlog)


# Frontal Pole Network -----------------------------------------------

# LME model: PC1Loading ~ Age + (1|Subject) # random intercept-only model 
lmerExec <- lmer(PC1Loading ~ Age + (1|SubID), data = subset(tbl, ICnetwork=="Frontal Pole"), REML=F)
summary(lmerExec)

# Quadratic Term: PC1Loading ~ Age^2 + (1|Subject)
lmerExec_quad <- lmer(PC1Loading ~ I(Age^2) + Age + (1|SubID), data = subset(tbl, ICnetwork=="Frontal Pole"), REML=F)
summary(lmerExec_quad)

# Logarithmic Term: PC1Loading ~ log(Age) + (1|Subject)
lmerExec_log <- lmer(PC1Loading ~ log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Frontal Pole"), REML=F)
summary(lmerExec_log)

lmerExecSex_log <- lmer(PC1Loading ~ log(Age) + Sex + (1|SubID), data = subset(tbl, ICnetwork=="Frontal Pole"), REML=F)
summary(lmerExecSex_log)

# Quadratic-log Term: PC1Loading ~ log(Age)^2 + log(Age) + (1|Subject)
lmerExec_quadlog <- lmer(PC1Loading ~ I(log(Age)^2) + log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Frontal Pole"), REML=F)
summary(lmerExec_quadlog)


# LME for Lateral Visual Network ------------------------------------------

# LME model: PC1Loading ~ Age + (1|Subject) # random intercept-only model 
lmerLV <- lmer(PC1Loading ~ Age + (1|SubID), data = subset(tbl, ICnetwork=="Lateral Visual"), REML=F)
summary(lmerLV)

# Quadratic Term: PC1Loading ~ Age^2 + (1|Subject)
lmerLV_quad <- lmer(PC1Loading ~ I(Age^2)+ Age + (1|SubID), data = subset(tbl, ICnetwork=="Lateral Visual"), REML=F)
summary(lmerLV_quad)

# Logarithmic Term: PC1Loading ~ log(Age) + (1|Subject)
lmerLV_log <- lmer(PC1Loading ~ log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Lateral Visual"), REML=F)
summary(lmerLV_log)

# Quadratic-log Term: PC1Loading ~ log(Age)^2 + log(Age) + (1|Subject)
lmerLV_quadlog <- lmer(PC1Loading ~ I(log(Age)^2) + log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Lateral Visual"), REML=F)
summary(lmerLV_quadlog)


# LME for Left Frontoparietal Network -------------------------------------

# LME model: PC1Loading ~ Age + (1|Subject) # random intercept-only model 
lmerLFP <- lmer(PC1Loading ~ Age + (1|SubID), data = subset(tbl, ICnetwork=="Left Frontoparietal"), REML=F)
summary(lmerLFP)

# Quadratic Term: PC1Loading ~ Age^2 + (1|Subject)
lmerLFP_quad <- lmer(PC1Loading ~ I(Age^2) + Age + (1|SubID), data = subset(tbl, ICnetwork=="Left Frontoparietal"), REML=F)
summary(lmerLFP_quad)

# Logarithmic Term: PC1Loading ~ log(Age) + (1|Subject)
lmerLFP_log <- lmer(PC1Loading ~ log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Left Frontoparietal"), REML=F)
summary(lmerLFP_log)

# Quadratic-log Term: PC1Loading ~ log(Age)^2 + log(Age) + (1|Subject)
lmerLFP_quadlog <- lmer(PC1Loading ~ I(log(Age)^2) + log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Left Frontoparietal"), REML=F)
summary(lmerLFP_quadlog)


# LME for Medial Visual Network -------------------------------------------

# LME model: PC1Loading ~ Age + (1|Subject) # random intercept-only model 
lmerMV <- lmer(PC1Loading ~ Age + (1|SubID), data = subset(tbl, ICnetwork=="Medial Visual"), REML=F)
summary(lmerMV)

# Quadratic Term: PC1Loading ~ Age^2 + (1|Subject)
lmerMV_quad <- lmer(PC1Loading ~ I(Age^2) + Age + (1|SubID), data = subset(tbl, ICnetwork=="Medial Visual"), REML=F)
summary(lmerMV_quad)

# Logarithmic Term: PC1Loading ~ log(Age) + (1|Subject)
lmerMV_log <- lmer(PC1Loading ~ log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Medial Visual"), REML=F)
summary(lmerMV_log)

# Quadratic-log Term: PC1Loading ~ log(Age)^2 + log(Age) + (1|Subject)
lmerMV_quadlog <- lmer(PC1Loading ~ I(log(Age)^2) + log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Medial Visual"), REML=F)
summary(lmerMV_quadlog)


# LME for Posterior DMN ---------------------------------------------------

# LME model: PC1Loading ~ Age + (1|Subject) # random intercept-only model 
lmerPDMN <- lmer(PC1Loading ~ Age + (1|SubID), data = subset(tbl, ICnetwork=="Posterior DMN"), REML=F)
summary(lmerPDMN)

# Quadratic Term: PC1Loading ~ Age^2 + (1|Subject)
lmerPDMN_quad <- lmer(PC1Loading ~ I(Age^2) + Age + (1|SubID), data = subset(tbl, ICnetwork=="Posterior DMN"), REML=F)
summary(lmerPDMN_quad)

# Logarithmic Term: PC1Loading ~ log(Age) + (1|Subject)
lmerPDMN_log <- lmer(PC1Loading ~ log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Posterior DMN"), REML=F)
summary(lmerPDMN_log)

# Quadratic-log Term: PC1Loading ~ log(Age)^2 + log(Age) + (1|Subject)
lmerPDMN_quadlog <- lmer(PC1Loading ~ I(log(Age)^2) + log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Posterior DMN"), REML=F)
summary(lmerPDMN_quadlog)


# LME for Right Frontoparietal Network ------------------------------------

# LME model: PC1Loading ~ Age + (1|Subject) # random intercept-only model 
lmerRFP <- lmer(PC1Loading ~ Age + (1|SubID), data = subset(tbl, ICnetwork=="Right Frontoparietal"), REML=F)
summary(lmerRFP)

# Quadratic Term: PC1Loading ~ Age^2 + (1|Subject)
lmerRFP_quad <- lmer(PC1Loading ~ I(Age^2) + Age + (1|SubID), data = subset(tbl, ICnetwork=="Right Frontoparietal"), REML=F)
summary(lmerRFP_quad)

# Logarithmic Term: PC1Loading ~ log(Age) + (1|Subject)
lmerRFP_log <- lmer(PC1Loading ~ log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Right Frontoparietal"), REML=F)
summary(lmerRFP_log)

# Quadratic-log Term: PC1Loading ~ log(Age)^2 + log(Age) + (1|Subject)
lmerRFP_quadlog <- lmer(PC1Loading ~ I(log(Age)^2) + log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Right Frontoparietal"), REML=F)
summary(lmerRFP_quadlog)


# LME for Salience Network ------------------------------------------------

# LME model: PC1Loading ~ Age + (1|Subject) # random intercept-only model 
lmerSal <- lmer(PC1Loading ~ Age + (1|SubID), data = subset(tbl, ICnetwork=="Salience"), REML=F)
summary(lmerSal)

# Quadratic Term: PC1Loading ~ Age^2 + (1|Subject)
lmerSal_quad <- lmer(PC1Loading ~ I(Age^2) + Age + (1|SubID), data = subset(tbl, ICnetwork=="Salience"), REML=F)
summary(lmerSal_quad)

# Logarithmic Term: PC1Loading ~ log(Age) + (1|Subject)
lmerSal_log <- lmer(PC1Loading ~ log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Salience"), REML=F)
summary(lmerSal_log)

# Quadratic-log Term: PC1Loading ~ log(Age)^2 + log(Age) + (1|Subject)
lmerSal_quadlog <- lmer(PC1Loading ~ I(log(Age)^2) + log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Salience"), REML=F)
summary(lmerSal_quadlog)


# LME for Sensorimotor Network --------------------------------------------

# LME model: PC1Loading ~ Age + (1|Subject) # random intercept-only model 
lmerSM <- lmer(PC1Loading ~ Age + (1|SubID), data = subset(tbl, ICnetwork=="Sensorimotor"), REML=F)
summary(lmerSM)

# Quadratic Term: PC1Loading ~ Age^2 + (1|Subject)
lmerSM_quad <- lmer(PC1Loading ~ I(Age^2) + Age + (1|SubID), data = subset(tbl, ICnetwork=="Sensorimotor"), REML=F)
summary(lmerSM_quad)

# Logarithmic Term: PC1Loading ~ log(Age) + (1|Subject)
lmerSM_log <- lmer(PC1Loading ~ log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Sensorimotor"), REML=F)
summary(lmerSM_log)

# Quadratic-log Term: PC1Loading ~ log(Age)^2 + log(Age) + (1|Subject)
lmerSM_quadlog <- lmer(PC1Loading ~ I(log(Age)^2) + log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Sensorimotor"), REML=F)
summary(lmerSM_quadlog)


# LME for Somatosensory Network -------------------------------------------

# LME model: PC1Loading ~ Age + (1|Subject) # random intercept-only model 
lmerSom <- lmer(PC1Loading ~ Age + (1|SubID), data = subset(tbl, ICnetwork=="Somatosensory"), REML=F)
summary(lmerSom)

# Quadratic Term: PC1Loading ~ Age^2 + (1|Subject)
lmerSom_quad <- lmer(PC1Loading ~ I(Age^2) + Age + (1|SubID), data = subset(tbl, ICnetwork=="Somatosensory"), REML=F)
summary(lmerSom_quad)

# Logarithmic Term: PC1Loading ~ log(Age) + (1|Subject)
lmerSom_log <- lmer(PC1Loading ~ log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Somatosensory"), REML=F)
summary(lmerSom_log)

# Quadratic-log Term: PC1Loading ~ log(Age)^2 + log(Age) + (1|Subject)
lmerSom_quadlog <- lmer(PC1Loading ~ I(log(Age)^2) + log(Age) + (1|SubID), data = subset(tbl, ICnetwork=="Somatosensory"), REML=F)
summary(lmerSom_quadlog)


#-------------------------------------------------------------------------------
# Create a table of the mixed model results

df_ADMN <- data.frame(
  estimate = c(signif(summary(lmerADMN)$coefficients[2],4),
               signif(summary(lmerADMN_quad)$coefficients[2],4),
               signif(summary(lmerADMN_log)$coefficients[2],4),
               signif(summary(lmerADMN_quadlog)$coefficients[2],4)),# Fixed effects estimate
  confints = c(paste(signif(confint(lmerADMN)[4,1],4),signif(confint(lmerADMN)[4,2],4),sep=", "),
               paste(signif(confint(lmerADMN_quad)[4,1],4),signif(confint(lmerADMN_quad)[4,2],4),sep=", "),
               paste(signif(confint(lmerADMN_log)[4,1],4),signif(confint(lmerADMN_log)[4,2],4),sep=", "),
               paste(signif(confint(lmerADMN_quadlog)[4,1],4),signif(confint(lmerADMN_quadlog)[4,2],4),sep=", ")),# Confidence interval (lower bound)
  AIC = c(summary(lmerADMN)$AICtab[1],
          summary(lmerADMN_quad)$AICtab[1],
          summary(lmerADMN_log)$AICtab[1],
          summary(lmerADMN_quadlog)$AICtab[1]),# AIC Score
  randEff = c(signif(as.data.frame(VarCorr(lmerADMN))[1,5],4),
              signif(as.data.frame(VarCorr(lmerADMN_quad))[1,5],4),
              signif(as.data.frame(VarCorr(lmerADMN_log))[1,5],4),
              signif(as.data.frame(VarCorr(lmerADMN_quadlog))[1,5],4)),# Random Effect standard deviation (Subject)
  pVal = c(signif(summary(lmerADMN)$coefficients[2,5],3),
           signif(summary(lmerADMN_quad)$coefficients[2,5],3),
           signif(summary(lmerADMN_log)$coefficients[2,5],3),
           signif(summary(lmerADMN_quadlog)$coefficients[2,5],3)))# p-value for the fixed age effect

df_Aud <- data.frame(
  estimate = c(signif(summary(lmerAud)$coefficients[2],4),
               signif(summary(lmerAud_quad)$coefficients[2],4),
               signif(summary(lmerAud_log)$coefficients[2],4),
               signif(summary(lmerAud_quadlog)$coefficients[2],4)),# Fixed effects estimate
  confints = c(paste(signif(confint(lmerAud)[4,1],4),signif(confint(lmerAud)[4,2],4),sep=", "),
               paste(signif(confint(lmerAud_quad)[4,1],4),signif(confint(lmerAud_quad)[4,2],4),sep=", "),
               paste(signif(confint(lmerAud_log)[4,1],4),signif(confint(lmerAud_log)[4,2],4),sep=", "),
               paste(signif(confint(lmerAud_quadlog)[4,1],4),signif(confint(lmerAud_quadlog)[4,2],4),sep=", ")),# Confidence interval (lower bound)
  AIC = c(summary(lmerAud)$AICtab[1],
          summary(lmerAud_quad)$AICtab[1],
          summary(lmerAud_log)$AICtab[1],
          summary(lmerAud_quadlog)$AICtab[1]),# AIC Score
  randEff = c(signif(as.data.frame(VarCorr(lmerAud))[1,5],4),
              signif(as.data.frame(VarCorr(lmerAud_quad))[1,5],4),
              signif(as.data.frame(VarCorr(lmerAud_log))[1,5],4),
              signif(as.data.frame(VarCorr(lmerAud_quadlog))[1,5],4)),# Random Effect standard deviation (Subject)
  pVal = c(signif(summary(lmerAud)$coefficients[2,5],3),
           signif(summary(lmerAud_quad)$coefficients[2,5],3),
           signif(summary(lmerAud_log)$coefficients[2,5],3),
           signif(summary(lmerAud_quadlog)$coefficients[2,5],3)))# p-value for the fixed age effect

df_CO <- data.frame(
  estimate = c(signif(summary(lmerCO)$coefficients[2],4),
               signif(summary(lmerCO_quad)$coefficients[2],4),
               signif(summary(lmerCO_log)$coefficients[2],4),
               signif(summary(lmerCO_quadlog)$coefficients[2],4)),# Fixed effects estimate
  confints = c(paste(signif(confint(lmerCO)[4,1],4),signif(confint(lmerCO)[4,2],4),sep=", "),
               paste(signif(confint(lmerCO_quad)[4,1],4),signif(confint(lmerCO_quad)[4,2],4),sep=", "),
               paste(signif(confint(lmerCO_log)[4,1],4),signif(confint(lmerCO_log)[4,2],4),sep=", "),
               paste(signif(confint(lmerCO_quadlog)[4,1],4),signif(confint(lmerCO_quadlog)[4,2],4),sep=", ")),# Confidence interval (lower bound)
  AIC = c(summary(lmerCO)$AICtab[1],
          summary(lmerCO_quad)$AICtab[1],
          summary(lmerCO_log)$AICtab[1],
          summary(lmerCO_quadlog)$AICtab[1]),# AIC Score
  randEff = c(signif(as.data.frame(VarCorr(lmerCO))[1,5],4),
              signif(as.data.frame(VarCorr(lmerCO_quad))[1,5],4),
              signif(as.data.frame(VarCorr(lmerCO_log))[1,5],4),
              signif(as.data.frame(VarCorr(lmerCO_quadlog))[1,5],4)),# Random Effect standard deviation (Subject)
  pVal = c(signif(summary(lmerCO)$coefficients[2,5],3),
           signif(summary(lmerCO_quad)$coefficients[2,5],3),
           signif(summary(lmerCO_log)$coefficients[2,5],3),
           signif(summary(lmerCO_quadlog)$coefficients[2,5],3)))# p-value for the fixed age effect

df_FP <- data.frame(
  estimate = c(signif(summary(lmerExec)$coefficients[2],4),
               signif(summary(lmerExec_quad)$coefficients[2],4),
               signif(summary(lmerExec_log)$coefficients[2],4),
               signif(summary(lmerExec_quadlog)$coefficients[2],4)),# Fixed effects estimate
  confints = c(paste(signif(confint(lmerExec)[4,1],4),signif(confint(lmerExec)[4,2],4),sep=", "),
               paste(signif(confint(lmerExec_quad)[4,1],4),signif(confint(lmerExec_quad)[4,2],4),sep=", "),
               paste(signif(confint(lmerExec_log)[4,1],4),signif(confint(lmerExec_log)[4,2],4),sep=", "),
               paste(signif(confint(lmerExec_quadlog)[4,1],4),signif(confint(lmerExec_quadlog)[4,2],4),sep=", ")),# Confidence interval (lower bound)
  AIC = c(summary(lmerExec)$AICtab[1],
          summary(lmerExec_quad)$AICtab[1],
          summary(lmerExec_log)$AICtab[1],
          summary(lmerExec_quadlog)$AICtab[1]),# AIC Score
  randEff = c(signif(as.data.frame(VarCorr(lmerExec))[1,5],4),
              signif(as.data.frame(VarCorr(lmerExec_quad))[1,5],4),
              signif(as.data.frame(VarCorr(lmerExec_log))[1,5],4),
              signif(as.data.frame(VarCorr(lmerExec_quadlog))[1,5],4)),# Random Effect standard deviation (Subject)
  pVal = c(signif(summary(lmerExec)$coefficients[2,5],3),
           signif(summary(lmerExec_quad)$coefficients[2,5],3),
           signif(summary(lmerExec_log)$coefficients[2,5],3),
           signif(summary(lmerExec_quadlog)$coefficients[2,5],3)))# p-value for the fixed age effect

df_LV <- data.frame(
  estimate = c(signif(summary(lmerLV)$coefficients[2],4),
               signif(summary(lmerLV_quad)$coefficients[2],4),
               signif(summary(lmerLV_log)$coefficients[2],4),
               signif(summary(lmerLV_quadlog)$coefficients[2],4)),# Fixed effects estimate
  confints = c(paste(signif(confint(lmerLV)[4,1],4),signif(confint(lmerLV)[4,2],4),sep=", "),
               paste(signif(confint(lmerLV_quad)[4,1],4),signif(confint(lmerLV_quad)[4,2],4),sep=", "),
               paste(signif(confint(lmerLV_log)[4,1],4),signif(confint(lmerLV_log)[4,2],4),sep=", "),
               paste(signif(confint(lmerLV_quadlog)[4,1],4),signif(confint(lmerLV_quadlog)[4,2],4),sep=", ")),# Confidence interval (lower bound)
  AIC = c(summary(lmerLV)$AICtab[1],
          summary(lmerLV_quad)$AICtab[1],
          summary(lmerLV_log)$AICtab[1],
          summary(lmerLV_quadlog)$AICtab[1]),# AIC Score
  randEff = c(signif(as.data.frame(VarCorr(lmerLV))[1,5],4),
              signif(as.data.frame(VarCorr(lmerLV_quad))[1,5],4),
              signif(as.data.frame(VarCorr(lmerLV_log))[1,5],4),
              signif(as.data.frame(VarCorr(lmerLV_quadlog))[1,5],4)),# Random Effect standard deviation (Subject)
  pVal = c(signif(summary(lmerLV)$coefficients[2,5],3),
           signif(summary(lmerLV_quad)$coefficients[2,5],3),
           signif(summary(lmerLV_log)$coefficients[2,5],3),
           signif(summary(lmerLV_quadlog)$coefficients[2,5],3)))# p-value for the fixed age effect

df_LFP <- data.frame(
  estimate = c(signif(summary(lmerLFP)$coefficients[2],4),
               signif(summary(lmerLFP_quad)$coefficients[2],4),
               signif(summary(lmerLFP_log)$coefficients[2],4),
               signif(summary(lmerLFP_quadlog)$coefficients[2],4)),# Fixed effects estimate
  confints = c(paste(signif(confint(lmerLFP)[4,1],4),signif(confint(lmerLFP)[4,2],4),sep=", "),
               paste(signif(confint(lmerLFP_quad)[4,1],4),signif(confint(lmerLFP_quad)[4,2],4),sep=", "),
               paste(signif(confint(lmerLFP_log)[4,1],4),signif(confint(lmerLFP_log)[4,2],4),sep=", "),
               paste(signif(confint(lmerLFP_quadlog)[4,1],4),signif(confint(lmerLFP_quadlog)[4,2],4),sep=", ")),# Confidence interval (lower bound)
  AIC = c(summary(lmerLFP)$AICtab[1],
          summary(lmerLFP_quad)$AICtab[1],
          summary(lmerLFP_log)$AICtab[1],
          summary(lmerLFP_quadlog)$AICtab[1]),# AIC Score
  randEff = c(signif(as.data.frame(VarCorr(lmerLFP))[1,5],4),
              signif(as.data.frame(VarCorr(lmerLFP_quad))[1,5],4),
              signif(as.data.frame(VarCorr(lmerLFP_log))[1,5],4),
              signif(as.data.frame(VarCorr(lmerLFP_quadlog))[1,5],4)),# Random Effect standard deviation (Subject)
  pVal = c(signif(summary(lmerLFP)$coefficients[2,5],3),
           signif(summary(lmerLFP_quad)$coefficients[2,5],3),
           signif(summary(lmerLFP_log)$coefficients[2,5],3),
           signif(summary(lmerLFP_quadlog)$coefficients[2,5],3)))# p-value for the fixed age effect

df_MV <- data.frame(
  estimate = c(signif(summary(lmerMV)$coefficients[2],4),
               signif(summary(lmerMV_quad)$coefficients[2],4),
               signif(summary(lmerMV_log)$coefficients[2],4),
               signif(summary(lmerMV_quadlog)$coefficients[2],4)),# Fixed effects estimate
  confints = c(paste(signif(confint(lmerMV)[4,1],4),signif(confint(lmerMV)[4,2],4),sep=", "),
               paste(signif(confint(lmerMV_quad)[4,1],4),signif(confint(lmerMV_quad)[4,2],4),sep=", "),
               paste(signif(confint(lmerMV_log)[4,1],4),signif(confint(lmerMV_log)[4,2],4),sep=", "),
               paste(signif(confint(lmerMV_quadlog)[4,1],4),signif(confint(lmerMV_quadlog)[4,2],4),sep=", ")),# Confidence interval (lower bound)
  AIC = c(summary(lmerMV)$AICtab[1],
          summary(lmerMV_quad)$AICtab[1],
          summary(lmerMV_log)$AICtab[1],
          summary(lmerMV_quadlog)$AICtab[1]),# AIC Score
  randEff = c(signif(as.data.frame(VarCorr(lmerMV))[1,5],4),
              signif(as.data.frame(VarCorr(lmerMV_quad))[1,5],4),
              signif(as.data.frame(VarCorr(lmerMV_log))[1,5],4),
              signif(as.data.frame(VarCorr(lmerMV_quadlog))[1,5],4)),# Random Effect standard deviation (Subject)
  pVal = c(signif(summary(lmerMV)$coefficients[2,5],3),
           signif(summary(lmerMV_quad)$coefficients[2,5],3),
           signif(summary(lmerMV_log)$coefficients[2,5],3),
           signif(summary(lmerMV_quadlog)$coefficients[2,5],3)))# p-value for the fixed age effect

df_PDMN <- data.frame(
  estimate = c(signif(summary(lmerPDMN)$coefficients[2],4),
               signif(summary(lmerPDMN_quad)$coefficients[2],4),
               signif(summary(lmerPDMN_log)$coefficients[2],4),
               signif(summary(lmerPDMN_quadlog)$coefficients[2],4)),# Fixed effects estimate
  confints = c(paste(signif(confint(lmerPDMN)[4,1],4),signif(confint(lmerPDMN)[4,2],4),sep=", "),
               paste(signif(confint(lmerPDMN_quad)[4,1],4),signif(confint(lmerPDMN_quad)[4,2],4),sep=", "),
               paste(signif(confint(lmerPDMN_log)[4,1],4),signif(confint(lmerPDMN_log)[4,2],4),sep=", "),
               paste(signif(confint(lmerPDMN_quadlog)[4,1],4),signif(confint(lmerPDMN_quadlog)[4,2],4),sep=", ")),# Confidence interval (lower bound)
  AIC = c(summary(lmerPDMN)$AICtab[1],
          summary(lmerPDMN_quad)$AICtab[1],
          summary(lmerPDMN_log)$AICtab[1],
          summary(lmerPDMN_quadlog)$AICtab[1]),# AIC Score
  randEff = c(signif(as.data.frame(VarCorr(lmerPDMN))[1,5],4),
              signif(as.data.frame(VarCorr(lmerPDMN_quad))[1,5],4),
              signif(as.data.frame(VarCorr(lmerPDMN_log))[1,5],4),
              signif(as.data.frame(VarCorr(lmerPDMN_quadlog))[1,5],4)),# Random Effect standard deviation (Subject)
  pVal = c(signif(summary(lmerPDMN)$coefficients[2,5],3),
           signif(summary(lmerPDMN_quad)$coefficients[2,5],3),
           signif(summary(lmerPDMN_log)$coefficients[2,5],3),
           signif(summary(lmerPDMN_quadlog)$coefficients[2,5],3)))# p-value for the fixed age effect

df_RFP <- data.frame(
  estimate = c(signif(summary(lmerRFP)$coefficients[2],4),
               signif(summary(lmerRFP_quad)$coefficients[2],4),
               signif(summary(lmerRFP_log)$coefficients[2],4),
               signif(summary(lmerRFP_quadlog)$coefficients[2],4)),# Fixed effects estimate
  confints = c(paste(signif(confint(lmerRFP)[4,1],4),signif(confint(lmerRFP)[4,2],4),sep=", "),
               paste(signif(confint(lmerRFP_quad)[4,1],4),signif(confint(lmerRFP_quad)[4,2],4),sep=", "),
               paste(signif(confint(lmerRFP_log)[4,1],4),signif(confint(lmerRFP_log)[4,2],4),sep=", "),
               paste(signif(confint(lmerRFP_quadlog)[4,1],4),signif(confint(lmerRFP_quadlog)[4,2],4),sep=", ")),# Confidence interval (lower bound)
  AIC = c(summary(lmerRFP)$AICtab[1],
          summary(lmerRFP_quad)$AICtab[1],
          summary(lmerRFP_log)$AICtab[1],
          summary(lmerRFP_quadlog)$AICtab[1]),# AIC Score
  randEff = c(signif(as.data.frame(VarCorr(lmerRFP))[1,5],4),
              signif(as.data.frame(VarCorr(lmerRFP_quad))[1,5],4),
              signif(as.data.frame(VarCorr(lmerRFP_log))[1,5],4),
              signif(as.data.frame(VarCorr(lmerRFP_quadlog))[1,5],4)),# Random Effect standard deviation (Subject)
  pVal = c(signif(summary(lmerRFP)$coefficients[2,5],3),
           signif(summary(lmerRFP_quad)$coefficients[2,5],3),
           signif(summary(lmerRFP_log)$coefficients[2,5],3),
           signif(summary(lmerRFP_quadlog)$coefficients[2,5],3)))# p-value for the fixed age effect

df_SM <- data.frame(
  estimate = c(signif(summary(lmerSM)$coefficients[2],4),
               signif(summary(lmerSM_quad)$coefficients[2],4),
               signif(summary(lmerSM_log)$coefficients[2],4),
               signif(summary(lmerSM_quadlog)$coefficients[2],4)),# Fixed effects estimate
  confints = c(paste(signif(confint(lmerSM)[4,1],4),signif(confint(lmerSM)[4,2],4),sep=", "),
               paste(signif(confint(lmerSM_quad)[4,1],4),signif(confint(lmerSM_quad)[4,2],4),sep=", "),
               paste(signif(confint(lmerSM_log)[4,1],4),signif(confint(lmerSM_log)[4,2],4),sep=", "),
               paste(signif(confint(lmerSM_quadlog)[4,1],4),signif(confint(lmerSM_quadlog)[4,2],4),sep=", ")),# Confidence interval (lower bound)
  AIC = c(summary(lmerSM)$AICtab[1],
          summary(lmerSM_quad)$AICtab[1],
          summary(lmerSM_log)$AICtab[1],
          summary(lmerSM_quadlog)$AICtab[1]),# AIC Score
  randEff = c(signif(as.data.frame(VarCorr(lmerSM))[1,5],4),
              signif(as.data.frame(VarCorr(lmerSM_quad))[1,5],4),
              signif(as.data.frame(VarCorr(lmerSM_log))[1,5],4),
              signif(as.data.frame(VarCorr(lmerSM_quadlog))[1,5],4)),# Random Effect standard deviation (Subject)
  pVal = c(signif(summary(lmerSM)$coefficients[2,5],3),
           signif(summary(lmerSM_quad)$coefficients[2,5],3),
           signif(summary(lmerSM_log)$coefficients[2,5],3),
           signif(summary(lmerSM_quadlog)$coefficients[2,5],3)))# p-value for the fixed age effect

df_Som <- data.frame(
  estimate = c(signif(summary(lmerSom)$coefficients[2],4),
               signif(summary(lmerSom_quad)$coefficients[2],4),
               signif(summary(lmerSom_log)$coefficients[2],4),
               signif(summary(lmerSom_quadlog)$coefficients[2],4)),# Fixed effects estimate
  confints = c(paste(signif(confint(lmerSom)[4,1],4),signif(confint(lmerSom)[4,2],4),sep=", "),
               paste(signif(confint(lmerSom_quad)[4,1],4),signif(confint(lmerSom_quad)[4,2],4),sep=", "),
               paste(signif(confint(lmerSom_log)[4,1],4),signif(confint(lmerSom_log)[4,2],4),sep=", "),
               paste(signif(confint(lmerSom_quadlog)[4,1],4),signif(confint(lmerSom_quadlog)[4,2],4),sep=", ")),# Confidence interval (lower bound)
  AIC = c(summary(lmerSom)$AICtab[1],
          summary(lmerSom_quad)$AICtab[1],
          summary(lmerSom_log)$AICtab[1],
          summary(lmerSom_quadlog)$AICtab[1]),# AIC Score
  randEff = c(signif(as.data.frame(VarCorr(lmerSom))[1,5],4),
              signif(as.data.frame(VarCorr(lmerSom_quad))[1,5],4),
              signif(as.data.frame(VarCorr(lmerSom_log))[1,5],4),
              signif(as.data.frame(VarCorr(lmerSom_quadlog))[1,5],4)),# Random Effect standard deviation (Subject)
  pVal = c(signif(summary(lmerSom)$coefficients[2,5],3),
           signif(summary(lmerSom_quad)$coefficients[2,5],3),
           signif(summary(lmerSom_log)$coefficients[2,5],3),
           signif(summary(lmerSom_quadlog)$coefficients[2,5],3)))# p-value for the fixed age effect

df_Sal <- data.frame(
  estimate = c(signif(summary(lmerSal)$coefficients[2],4),
               signif(summary(lmerSal_quad)$coefficients[2],4),
               signif(summary(lmerSal_log)$coefficients[2],4),
               signif(summary(lmerSal_quadlog)$coefficients[2],4)),
  confints = c(paste(signif(confint(lmerSal)[4,1],4),signif(confint(lmerSom)[4,2],4),sep=", "),
               paste(signif(confint(lmerSal_quad)[4,1],4),signif(confint(lmerSom_quad)[4,2],4),sep=", "),
               paste(signif(confint(lmerSal_log)[4,1],4),signif(confint(lmerSom_log)[4,2],4),sep=", "),
               paste(signif(confint(lmerSal_quadlog)[4,1],4),signif(confint(lmerSom_quadlog)[4,2],4),sep=", ")),# Confidence interval (lower bound)
  AIC = c(summary(lmerSal)$AICtab[1],
          summary(lmerSal_quad)$AICtab[1],
          summary(lmerSal_log)$AICtab[1],
          summary(lmerSal_quadlog)$AICtab[1]),# AIC Score
  randEff = c(signif(as.data.frame(VarCorr(lmerSal))[1,5],4),
              signif(as.data.frame(VarCorr(lmerSal_quad))[1,5],4),
              signif(as.data.frame(VarCorr(lmerSal_log))[1,5],4),
              signif(as.data.frame(VarCorr(lmerSal_quadlog))[1,5],4)),# Random Effect standard deviation (Subject)
  pVal = c(signif(summary(lmerSal)$coefficients[2,5],3),
           signif(summary(lmerSal_quad)$coefficients[2,5],3),
           signif(summary(lmerSal_log)$coefficients[2,5],3),
           signif(summary(lmerSal_quadlog)$coefficients[2,5],3)))# p-value for the fixed age effect


library(plyr)
library(dplyr)
cors <- ddply(tbl, .(ICnetwork), summarise, cor = round(cor(Age, PC1Loading, method = "spearman"), 2),
              p = round(cor.test(Age, PC1Loading, method = "spearman")$p.value,4))

# Combine data frames for each network and create a large dataframe for plotting
# Columns = ICnetwork, Model type, AIC score. 
library(tidyverse)
df_all <- bind_rows(df_ADMN,df_Aud,df_CO,df_FP,df_LV,df_LFP,df_MV,df_PDMN,
                    df_RFP,df_Sal,df_SM, df_Som)
ICnetworks <- c(rep("Anterior DMN",4),rep("Auditory",4),rep("Cingulo-opercular",4),rep("Frontal Pole",4),
                rep("Lateral Visual",4),rep("Left Frontoparietal",4),rep("Medial Visual",4),rep("Posterior DMN",4),
                rep("Right Frontoparietal",4),rep("Salience",4),rep("Sensorimotor",4),rep("Somatosensory",4))
ModelType <- rep(c("Linear","Quadratic","Log","Quadratic Log"),12)
df_all$ICnetworks <- ICnetworks
df_all$ModelType <- ModelType


# Create a barplot of the AIC scores (Figure 5 in manuscript)
(AIC_bar <- ggplot(df_all, aes(x = ICnetworks , y = AIC, fill = ModelType))+
    geom_bar(position="dodge", stat="identity")+
    ylab("AIC Score")+
    theme_classic()+
    theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)))

# Save figure
ggsave("./figures/R/AIC_scores.png",height=4,width=6.5,dpi=300)

