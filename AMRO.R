# https://google.github.io/styleguide/Rguide.xml

# Remove all variables from the environment. ls() lists variables, rm() removes variables.
# This won't remove variables beginning with '.', use rm(list = ls(all.names = TRUE)) for that.
rm(list = ls())

library(unmarked)
library(reshape2)
library(ggplot2)
library(plyr)

setwd("C:/Users/Don/projects/AMRO")

pc<-read.csv('PC_DATA_16.csv', header=TRUE)

#get rid of surveys from no planting no maintenance due to not enough survey points

pc <- subset(pc, pc[,2] != "Maintenance_No_Planting"  & pc[,2] != "No_Planting_No_Maintenance", drop=T)

#create a column for age value and fill it




pc$age <- ifelse(pc[,2] == "Original_y25_1", 25,
                 ifelse(pc[,2] == "Original_y25_2", 25,
                        ifelse(pc[,2] == "Original_y25_3", 25,
                               ifelse(pc[,2] == "Original_y25_4", 25,
                                      ifelse(pc[,2] == "Church_y15_3", 15,
                                             ifelse(pc[,2] == "Church_y15_2", 15,
                                                    ifelse(pc[,2] == "Triangle_y15_2", 15,
                                                           ifelse(pc[,2] == "Triangle_y15_1", 15,
                                                                  ifelse(pc[,2] == "Triangle_y7_2", 7,
                                                                         ifelse(pc[,2] == "Triangle_y7_1", 7,
                                                                                ifelse(pc[,2] == "Fox_Den_y7_2", 7,      
                                                                                       ifelse(pc[,2] == "Fox_Den_y5_1", 5, 
                                                                                              ifelse(pc[,2] == "Fox_Den_y5_2", 5, 
                                                                                                     ifelse(pc[,2] == "Fox_Den_y5_3", 5,       
                                                                                                            ifelse(pc[,2] == "Fox_Den_y3_1", 3,    
                                                                                                                   ifelse(pc[,2] == "Fox_Den_y3_2", 3,   
                                                                                                                          ifelse(pc[,2] == "Fox_Den_y3_3", 3,  
                                                                                                                                 ifelse(pc[,2] == "Fox_Den_y3_4", 3,
                                                                                                                                        ifelse(pc[,2] == "Mowed_y0_3", 0,
                                                                                                                                               ifelse(pc[,2] == "Mowed_y0_4", 0,
                                                                                                                                                      ifelse(pc[,2] == "Fox_Den_y0_1", 0,
                                                                                                                                                             
                                                                                                                                                             NA  )))))))))))))))))))))

#now create a new column called category based on the age of tree, which will be used as the block for analysis

pc$category <- ifelse(pc[,2] == "Original_y25_1", "y25",
                      ifelse(pc[,2] == "Original_y25_2","y25",
                             ifelse(pc[,2] == "Original_y25_3","y25",
                                    ifelse(pc[,2] == "Original_y25_4","y25",
                                           ifelse(pc[,2] == "Church_y15_3", "y15",
                                                  ifelse(pc[,2] == "Church_y15_2", "y15",
                                                         ifelse(pc[,2] == "Triangle_y15_2", "y15",
                                                                ifelse(pc[,2] == "Triangle_y15_1", "y15",
                                                                       ifelse(pc[,2] == "Triangle_y7_2", "y7",
                                                                              ifelse(pc[,2] == "Triangle_y7_1", "y7",
                                                                                     ifelse(pc[,2] == "Fox_Den_y7_2", "y7",      
                                                                                            ifelse(pc[,2] == "Fox_Den_y5_1", "y5", 
                                                                                                   ifelse(pc[,2] == "Fox_Den_y5_2", "y5", 
                                                                                                          ifelse(pc[,2] == "Fox_Den_y5_3", "y5",       
                                                                                                                 ifelse(pc[,2] == "Fox_Den_y3_1", "y3",    
                                                                                                                        ifelse(pc[,2] == "Fox_Den_y3_2", "y3",   
                                                                                                                               ifelse(pc[,2] == "Fox_Den_y3_3", "y3",  
                                                                                                                                      ifelse(pc[,2] == "Fox_Den_y3_4", "y3",
                                                                                                                                             ifelse(pc[,2] == "Mowed_y0_3", "y0",
                                                                                                                                                    ifelse(pc[,2] == "Mowed_y0_4", "y0",
                                                                                                                                                           ifelse(pc[,2] == "Fox_Den_y0_1", "y0",
                                                                                                                                                                  ifelse(pc[,2] == "Forest_Interior_1", "mature",
                                                                                                                                                                         ifelse(pc[,2] == "Forest_Interior_2", "mature",
                                                                                                                                                                                ifelse(pc[,2] == "Forest_Interior_3", "mature",
                                                                                                                                                                                       ifelse(pc[,2] == "Forest_Edge_1", "edge",
                                                                                                                                                                                              ifelse(pc[,2] == "Forest_Edge_2", "edge",
                                                                                                                                                                                                     ifelse(pc[,2] == "Forest_Edge_3", "edge",
                                                                                                                                                                                                            
                                                                                                                                                                                                            NA  )))))))))))))))))))))))))))

str(pc) 

#CREATE NEW COLUMN WITH MONTH DATA

pc$date.char <- as.character(pc$DATE)
pc$date.char.sub <-substr(pc$date.char,0,2)
pc$month <- ifelse(pc$date.char.sub == "9/", "sep",
                   ifelse(pc$date.char.sub == "10", "oct",
                          ifelse(pc$date.char.sub == "11", "nov",
                                 NA)))
pc$date.char <- NULL
pc$date.char.sub <- NULL


#combine all 0-11 m and 11-25m observations to make a better half normal function and even distance breaks

pc$dist.band.num <- ifelse(pc$Distance.Band == "0-10 m", "1",
                           ifelse(pc$Distance.Band == "11-25 m", "1",
                                  ifelse(pc$Distance.Band == "25-50 m", "2",
                                         ifelse(pc$Distance.Band == ">50 m", "3",
                                                ifelse(pc$Distance.Band == "FO", "4",
                                                       NA)))))

##Create another column with month and category as a unique identifier

pc$block_id <- paste(pc$category, pc$month, sep='_')

##create one more category to identify unique surveys

pc$survey_id <- paste(pc$Point.Name, pc$DATE, sep='_')


###Now I think the data are in order, but we still need to manipulate it into the pieces we want to analyze

#make a data frame wit the covariates

det.covs <- pc[,c(4:8,23:25,27:28)]

det.covs.dd = det.covs[!duplicated(det.covs), ]

#pc.all will be all species using the area

pc.all <- pc


#melt count data
data.count.melt <- melt(pc.all, id=c("survey_id", "dist.band.num","block_id","month","category","age","Distance.Band","Species.Code","Point.Name","DATE"), measure=c("Total.Count"), na.rm=FALSE)


###Cast count data using the sum of all sparrows seen 

count.data <- dcast(data.count.melt, survey_id ~ dist.band.num, fun.aggregate=sum, subset = .((Species.Code == "AMRO" ))) # | (Species.Code=="AMRO" ) | (Species.Code=="VEER") | (Species.Code=="SWTH") | (Species.Code=="WOTH") | (Species.Code=="EABL"))) # | (Species.Code=="SAVS") | (Species.Code=="SWSP") | (Species.Code=="FOSP"))) 
count.data[,4] <- NULL

all.birds <- merge(det.covs.dd, count.data, by= "survey_id", all=T)
all.birds[is.na(all.birds)] <- 0

all.birds.y0.sep <- subset(all.birds, all.birds$block_id == "y0_sep")
all.birds.y0.oct <- subset(all.birds, all.birds$block_id == "y0_oct")
all.birds.y0.nov <- subset(all.birds, all.birds$block_id == "y0_nov")

all.birds.y3.sep <- subset(all.birds, all.birds$block_id == "y3_sep")
all.birds.y3.oct <- subset(all.birds, all.birds$block_id == "y3_oct")
all.birds.y3.nov <- subset(all.birds, all.birds$block_id == "y3_nov")

all.birds.y5.sep <- subset(all.birds, all.birds$block_id == "y5_sep")
all.birds.y5.oct <- subset(all.birds, all.birds$block_id == "y5_oct")
all.birds.y5.nov <- subset(all.birds, all.birds$block_id == "y5_nov")

all.birds.y7.sep <- subset(all.birds, all.birds$block_id == "y7_sep")
all.birds.y7.oct <- subset(all.birds, all.birds$block_id == "y7_oct")
all.birds.y7.nov <- subset(all.birds, all.birds$block_id == "y7_nov")

all.birds.y15.sep <- subset(all.birds, all.birds$block_id == "y15_sep")
all.birds.y15.oct <- subset(all.birds, all.birds$block_id == "y15_oct")
all.birds.y15.nov <- subset(all.birds, all.birds$block_id == "y15_nov")

all.birds.y25.sep <- subset(all.birds, all.birds$block_id == "y25_sep")
all.birds.y25.oct <- subset(all.birds, all.birds$block_id == "y25_oct")
all.birds.y25.nov <- subset(all.birds, all.birds$block_id == "y25_nov")

all.birds.y25.sep <- subset(all.birds, all.birds$block_id == "y25_sep")
all.birds.y25.oct <- subset(all.birds, all.birds$block_id == "y25_oct")
all.birds.y25.nov <- subset(all.birds, all.birds$block_id == "y25_nov")

all.birds.edge.sep <- subset(all.birds, all.birds$block_id == "edge_sep")
all.birds.edge.oct <- subset(all.birds, all.birds$block_id == "edge_oct")
all.birds.edge.nov <- subset(all.birds, all.birds$block_id == "edge_nov")

all.birds.mature.sep <- subset(all.birds, all.birds$block_id == "mature_sep")
all.birds.mature.oct <- subset(all.birds, all.birds$block_id == "mature_oct")
all.birds.mature.nov <- subset(all.birds, all.birds$block_id == "mature_nov")

# makeumf <- function(DataIn){ 
#   
#   unmarkedFrameDS(y=as.matrix(all.birds.y0.sep[,11:12]),
#                                      siteCovs=data.frame(scale(all.birds.y0.sep[,3:6])),
#                                      dist.breaks=c(0,25,50), unitsIn="m", survey="point")
#   
# }

######Cat y0


all.birds.y0.sep.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y0.sep[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y0.sep[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y0.sep <- distsamp(~1 ~1, all.birds.y0.sep.umf))

all.birds.y0.oct.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y0.oct[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y0.oct[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y0.oct <- distsamp(~1 ~1, all.birds.y0.oct.umf))

all.birds.y0.nov.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y0.nov[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y0.nov[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y0.nov <- distsamp(~1 ~1, all.birds.y0.nov.umf))




######Cat y3


all.birds.y3.sep.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y3.sep[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y3.sep[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y3.sep <- distsamp(~1 ~1, all.birds.y3.sep.umf))

all.birds.y3.oct.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y3.oct[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y3.oct[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y3.oct <- distsamp(~1 ~1, all.birds.y3.oct.umf))

all.birds.y3.nov.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y3.nov[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y3.nov[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y3.nov <- distsamp(~1 ~1, all.birds.y3.nov.umf))



######Cat y5


all.birds.y5.sep.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y5.sep[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y5.sep[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y5.sep <- distsamp(~1 ~1, all.birds.y5.sep.umf))

all.birds.y5.oct.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y5.oct[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y5.oct[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y5.oct <- distsamp(~1 ~1, all.birds.y5.oct.umf))

all.birds.y5.nov.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y5.nov[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y5.nov[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y5.nov <- distsamp(~1 ~1, all.birds.y5.nov.umf))



######Cat y7


all.birds.y7.sep.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y7.sep[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y7.sep[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y7.sep <- distsamp(~1 ~1, all.birds.y7.sep.umf))

all.birds.y7.oct.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y7.oct[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y7.oct[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y7.oct <- distsamp(~1 ~1, all.birds.y7.oct.umf))

all.birds.y7.nov.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y7.nov[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y7.nov[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y7.nov <- distsamp(~1 ~1, all.birds.y7.nov.umf))


######Cat y15


all.birds.y15.sep.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y15.sep[,11:12]),
                                         siteCovs=data.frame(scale(all.birds.y15.sep[,3:6])),
                                         dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y15.sep <- distsamp(~1 ~1, all.birds.y15.sep.umf))

all.birds.y15.oct.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y15.oct[,11:12]),
                                         siteCovs=data.frame(scale(all.birds.y15.oct[,3:6])),
                                         dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y15.oct <- distsamp(~1 ~1, all.birds.y15.oct.umf))

all.birds.y15.nov.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y15.nov[,11:12]),
                                         siteCovs=data.frame(scale(all.birds.y15.nov[,3:6])),
                                         dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y15.nov <- distsamp(~1 ~1, all.birds.y15.nov.umf))



######Cat y25


all.birds.y25.sep.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y25.sep[,11:12]),
                                         siteCovs=data.frame(scale(all.birds.y25.sep[,3:6])),
                                         dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y25.sep <- distsamp(~1 ~1, all.birds.y25.sep.umf))

all.birds.y25.oct.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y25.oct[,11:12]),
                                         siteCovs=data.frame(scale(all.birds.y25.oct[,3:6])),
                                         dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y25.oct <- distsamp(~1 ~1, all.birds.y25.oct.umf))

all.birds.y25.nov.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y25.nov[,11:12]),
                                         siteCovs=data.frame(scale(all.birds.y25.nov[,3:6])),
                                         dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y25.nov <- distsamp(~1 ~1, all.birds.y25.nov.umf))


######Cat edge


all.birds.edge.sep.umf <- unmarkedFrameDS(y=as.matrix(all.birds.edge.sep[,11:12]),
                                          siteCovs=data.frame(scale(all.birds.edge.sep[,3:6])),
                                          dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.edge.sep <- distsamp(~1 ~1, all.birds.edge.sep.umf))

all.birds.edge.oct.umf <- unmarkedFrameDS(y=as.matrix(all.birds.edge.oct[,11:12]),
                                          siteCovs=data.frame(scale(all.birds.edge.oct[,3:6])),
                                          dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.edge.oct <- distsamp(~1 ~1, all.birds.edge.oct.umf))

all.birds.edge.nov.umf <- unmarkedFrameDS(y=as.matrix(all.birds.edge.nov[,11:12]),
                                          siteCovs=data.frame(scale(all.birds.edge.nov[,3:6])),
                                          dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.edge.nov <- distsamp(~1 ~1, all.birds.edge.nov.umf))


######Cat mature


all.birds.mature.sep.umf <- unmarkedFrameDS(y=as.matrix(all.birds.mature.sep[,11:12]),
                                            siteCovs=data.frame(scale(all.birds.mature.sep[,3:6])),
                                            dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.mature.sep <- distsamp(~1 ~1, all.birds.mature.sep.umf))

all.birds.mature.oct.umf <- unmarkedFrameDS(y=as.matrix(all.birds.mature.oct[,11:12]),
                                            siteCovs=data.frame(scale(all.birds.mature.oct[,3:6])),
                                            dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.mature.oct <- distsamp(~1 ~1, all.birds.mature.oct.umf))

all.birds.mature.nov.umf <- unmarkedFrameDS(y=as.matrix(all.birds.mature.nov[,11:12]),
                                            siteCovs=data.frame(scale(all.birds.mature.nov[,3:6])),
                                            dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.mature.nov <- distsamp(~1 ~1, all.birds.mature.nov.umf))


#####Now read in the results data and make some graphs

all.birds.results <- read.csv("AMRO Results.csv")

## add and manipulate data for better visualization

all.birds.results <- merge(all.birds.results, all.birds, by="block_id")
all.birds.results[,c(13:20,23:26)] <- NULL
all.birds.results = all.birds.results[!duplicated(all.birds.results), ]
all.birds.results$month <- as.factor(all.birds.results$month) 
all.birds.results$month <- factor(all.birds.results$month, levels = rev(levels(all.birds.results$month)))
all.birds.results$category <- as.factor(all.birds.results$category)
all.birds.results$category <- factor(all.birds.results$category, levels = c( "y0", "y3", "y5", "y7", "y15", "y25", "edge", "mature"))
all.birds.results$block_id <- as.factor(all.birds.results$block_id )
all.birds.results$block_id <- factor(all.birds.results$block_id, levels = c("y0_sep", "y0_oct", "y0_nov", "y3_sep", "y3_oct", "y3_nov", "y5_sep", "y5_oct", "y5_nov", "y7_sep", "y7_oct", "y7_nov", "y15_sep", "y15_oct", "y15_nov", "y25_sep", "y25_oct", "y25_nov", "edge_sep", "edge_oct", "edge_nov", "mature_sep", "mature_oct", "mature_nov") )
levels(all.birds.results$block_id)

##Now plot with ggplot2

p <- ggplot(data = all.birds.results, aes(x = category, y = Density, fill= month)) +
  geom_bar( stat="identity", color = "black", position=position_dodge() )+
  geom_errorbar(stat="identity", aes(x = category, ymin=Density-X95.ci, ymax=Density+X95.ci), width=.2,
                position=position_dodge(width = 1) ) +
  ggtitle("Relative Abundance of American Robins Using Areas of Different Tree
          Planting Treatments at Middle Run Valley Park in Fall 2016") +
  labs(x="Category",y="Density (birds/Ha)")

p + scale_fill_manual(values=c('darkgreen','gold', 'firebrick1'))

