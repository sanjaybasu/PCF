x <- seq(1,10, length.out=20) #vis/pt/yr
y <- seq(100,1000, length.out=20) #elig mcare pts/fte md
data <- expand.grid(X=x, Y=y)

tradffs = data$X*data$Y*112.58*1.2
pbp = data$Y*32.33*12
pcffffs = data$X*data$Y*50*1.2
tpcf = pbp+pcffffs

data$Z <- tpcf-tradffs

# Levelplot with ggplot2
library(ggplot2)
library(RColorBrewer)
library(scales)
ggplot(data, aes(X, Y, fill= Z)) +
  geom_tile(colour= "white") + 
  scale_fill_distiller(palette = "Spectral", direction=1, labels = comma) + 
  #remove axis labels, add title
  labs(x="Practice visits/beneficiary/year, historically",y="Medicare FFS beneficiaries attributed to practice (#)",title="Change in gross revenue from Medicare due to PCF")+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        panel.background = element_blank(), 
        axis.line = element_line(colour = "gray"), 
        axis.text=element_text(size=12),
        axis.title=element_text(size=14),
        plot.title = element_text(face = "bold"),
        legend.title=element_text(size=14),
        legend.text=element_text(size=12))+
  labs(fill = expression(Delta~"$/MD/yr"))