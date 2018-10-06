## gg-FUN!
setwd("NMG_analysis/")
library(ggplot2)
library(reshape2)
library(dplyr)
NMG_2017 <- read.csv("data/NMG_2017.csv")
example <- NMG_2017 %>% 
  select(c("X", paste0("actdebt", seq(1, 11))), "age_grp")
g_data <- melt(example, c("X", "age_grp"))%>%
  group_by(variable, age_grp)%>%
  #rowwise()%>%
  count(value)
g <- ggplot(data = g_data, 
            aes(x = variable, 
                y = n))
g+geom_bar(stat = "identity", 
           aes(fill = value))+ 
  theme_minimal() +
  ylim(-250,2000) +
  theme(
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.margin = unit(rep(-2,4), "cm")     # This remove unnecessary margin around plot
  ) + 
  coord_polar(start = 0) + facet_grid(cols = vars(age_grp))
##  geom_text(data=label_data, 
#            aes(x=variable, y=value+10, 
#                label=variable, hjust=hjust), 
#            color="black", fontface="bold",
#            alpha=0.6, size=2.5, 
#            angle= label_data$angle, 
#            inherit.aes = FALSE )
