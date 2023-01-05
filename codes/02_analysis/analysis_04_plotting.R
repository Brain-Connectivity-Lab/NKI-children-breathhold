# NKI Child Longitudinal Data
# Plotting results
# Corresponds to manuscript figures 1,2,4,&6
# For figure 3, use BrainNetViewer and for figure 5, use analysis_03_mixed_effects_model.R code


setwd("C:/Users/chend/Desktop/Research/NKI_Development")

tbl <- read.csv("table_lme_bas1flu1flu2.csv")


#-------------------------------------------------------------------------------
## Age distribution dumbbell plot (Figure 1)
library(ggplot2) # GGplot package for visualizing data
library(ggalt)
library(reshape2)
library(tidyverse)

tbl_AgeOnly <- select(tbl, c(1:2,5))
tbl_AgeOnlyWide <- reshape(tbl_AgeOnly, idvar = "SubID" , timevar = "Session", direction = "wide")

(p1 <- ggplot() +
    # reshape the data frame & get min value so you can draw an eye-tracking line (this is one geom)
    geom_segment(
      data = gather(tbl_AgeOnlyWide, measure, val, -SubID), #%>% 
      aes(x = 0, xend = val, y = SubID, yend = SubID),
      linetype = "dotted", size = 0.5, color = "gray80"
    ) +
    scale_y_discrete(limits = tbl_AgeOnlyWide$SubID) + # have it ordered from youngest age to oldest age
    # reshape the data frame & get min/max category values so you can draw the segment (this is another geom)
    geom_segment(
      data = gather(tbl_AgeOnlyWide, measure, val, -SubID) %>% 
        group_by(SubID) %>% 
        summarise(start = val[1], end = val[3]) %>% 
        ungroup(),
      aes(x = start, xend = end, y = SubID, yend = SubID),
      color = "black", size = 0.5
    ) +
    geom_segment(
      data = gather(tbl_AgeOnlyWide, measure, val, -SubID) %>%
        group_by(SubID) %>%
        summarise(start = val[1], end = val[2]) %>%
        ungroup(),
      aes(x = start, xend = end, y = SubID, yend = SubID),
      color = "black", size = 0.5
    ) +
    geom_segment(
      data = gather(tbl_AgeOnlyWide, measure, val, -SubID) %>%
        group_by(SubID) %>%
        summarise(start = val[2], end = val[3]) %>%
        ungroup(),
      aes(x = start, xend = end, y = SubID, yend = SubID),
      color = "black", size = 0.5
    ) +
    
    # reshape the data frame & plot the points
    geom_point(
      data = gather(tbl_AgeOnlyWide, measure, value,-SubID),
      aes(value, SubID, color = measure),
      size = 1.3
    ) +
    # i just extended the scale a bit + put axis on top; choose aesthetics that work
    # for you
    labs(x = "Age (years)", y = "Subject",
         title = "Age at each Scan Session") +
    theme_classic() +
    theme(legend.position = "top",
          axis.text.y = element_blank(),
          panel.grid.minor = element_line(
            size = 0.5,
            linetype = "solid",
            color = "gray80"
          )) +
    scale_x_continuous(limits = c(5, 20), n.breaks = 8) +
    scale_color_discrete(name = "Session", labels = c("BAS1", "FLU1", "FLU2")))

# Save figure
ggsave("./figures/R/AgeAtSessions.png", height=4,width=4,dpi=300)


#-------------------------------------------------------------------------------
## Head motion - Framewise Displacement values (Figure 2)
setwd("C:/Users/chend/Desktop/Research/NKI_Development/head_motion_correction")
library(R.matlab)
library(ggplot2)

bas1 <- readMat("BAS1_fd.mat")
flu1 <- readMat("FLU1_fd.mat")
flu2 <- readMat("FLU2_fd.mat")
allSessions <- readMat("allSession_fd.mat")

# Get Age Info
bas1Age <- readMat("BAS1_age.mat")
flu1Age <- readMat("FLU1_age.mat")
flu2Age <- readMat("FLU2_age.mat")

# Create dataframes
fd_max_rotat <- c(bas1$fd.max.rotat, flu1$fd.max.rotat, flu2$fd.max.rotat)
fd_max_trans <- c(bas1$fd.max.trans, flu1$fd.max.trans, flu2$fd.max.trans)
fd_mean_rotat <- c(bas1$fd.mean.rotat, flu1$fd.mean.rotat, flu2$fd.mean.rotat)
fd_mean_trans <- c(bas1$fd.mean.trans, flu1$fd.mean.rotat, flu2$fd.mean.rotat)
age <- c(bas1Age$agesFinal, flu1Age$agesFinal, flu2Age$agesFinal)
session <- c(rep('BAS1',90), rep('FLU1',82), rep('FLU2',60))

df <- data.frame(session, age, fd_max_rotat, fd_max_trans, fd_mean_rotat, fd_mean_trans)

allSess_df <- data.frame(allSessions$fd.max.rotat, allSessions$fd.max.trans, allSessions$fd.mean.rotat, allSessions$fd.mean.trans, allSessions$agesSort)

# Create plots for the different Sessions 
library(patchwork)
(p1 <- ggplot(df, aes(x = age, y = fd_mean_rotat, group = session, color = session))+ geom_point(size=1.5)+
    labs(x='Age (years)',title='Mean Rotation', y='', color = "Session")+
    theme_classic()+
    geom_hline(yintercept=0.3, linetype="dashed", color = "black"))+
  theme(plot.title = element_text(hjust = 0.5))

(p2 <- ggplot(df, aes(x = age, y = fd_mean_trans, group = session, color = session))+ geom_point(size=1.5)+
    labs(x='Age (years)',title='Mean Translation', y='', color = "Session")+
    theme_classic()+
    geom_hline(yintercept=0.3, linetype="dashed", color = "black"))+
  theme(plot.title = element_text(hjust = 0.5))

(p3 <- ggplot(df, aes(x = age, y = fd_max_rotat, group = session, color = session))+ geom_point(size=1.5)+
    labs(x='Age (years)',title='Max Rotation', y='', color = "Session")+
    theme_classic()+
    geom_hline(yintercept=2, linetype="dashed", color = "black"))+
  theme(plot.title = element_text(hjust = 0.5))

(p4 <- ggplot(df, aes(x = age, y = fd_max_trans, group = session, color = session))+ geom_point(size=1.5)+
    labs(x='Age (years)',title='Max Translation', y='', color = "Session")+
    theme_classic()+
    geom_hline(yintercept=2, linetype="dashed", color = "black"))+
  theme(plot.title = element_text(hjust = 0.5))

p1+theme(plot.title = element_text(hjust = 0.5))+p2+
  theme(plot.title = element_text(hjust = 0.5))+p3+
  theme(plot.title = element_text(hjust = 0.5))+p4+
  theme(plot.title = element_text(hjust = 0.5))+
  plot_annotation(tag_levels = 'A')+
  plot_layout(guides = "collect")

# Save figure
ggsave("../figures/R/headmotion.png",height=4,width=6.5,dpi=300)


#-------------------------------------------------------------------------------
## Spaghetti plot (Figure 4)
(p <- ggplot(aes(x = Age, y = PC1Loading, group = SubID, colour = Session), data = tbl) + 
   geom_point() + 
   geom_line(color = "black", alpha = 0.3) +
   facet_wrap(~ ICnetwork) + 
   theme_classic()+
   theme(strip.background = element_blank())+
   theme(panel.spacing = unit(1, "lines"))+
   xlab("Age (years)")+ 
   ylab("PC1 Loading"))

# Save Spaghetti plot
ggsave("./figures/R/PC1LoadingAgeBAS1FLU1FLU2_gray.png",height=4,width=6.5,dpi=300)


#-------------------------------------------------------------------------------
## Showing all three sessions, separated by sex, for the 3 networks (Figure 6)
tbl$Sex <- factor(tbl$Sex, levels = c(2,1), labels = c("Female","Male")) # treat as categorical variables
(p2 <- ggplot(aes(x = Age, y = PC1Loading, group = SubID, colour = Sex), 
              data = subset(tbl,ICnetwork == "Frontal Pole" |
                              ICnetwork == "Lateral Visual" |
                              ICnetwork == "Medial Visual")) +
    geom_point() +
    geom_line(size = 0.05) +
    facet_wrap( ~ ICnetwork) +
    theme_classic() +
    theme(strip.background = element_blank())+
    theme(panel.spacing = unit(1, "lines"))+
    xlab("Age (years)") +
    ylab("PC1 Loading"))

# Save figure
ggsave("./figures/R/PC1LoadingAgeFemaleMale_allsessions_nofit.png", height=2.5,width=6,dpi=300)

