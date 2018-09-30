## gg-FUN!
library(ggplot2)
library(reshape2)
class(NMG_2017$actdebt1)

example <- NMG_2017 %>% select(actdebt1, actdebt2, actdebt3, actdebt4, actdebt5, actdebt6, actdebt7)
g_data <- melt(example, measure.vars = c(as.character(colnames(example))))
g <- ggplot(data = g_data, aes(x = variable, fill = value))
g+geom_bar()
