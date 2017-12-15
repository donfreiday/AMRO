# https://google.github.io/styleguide/Rguide.xml

# Remove all variables from the environment. ls() lists variables, rm() removes variables.
# This won't remove variables beginning with '.', use rm(list = ls(all.names = TRUE)) for that.
rm(list = ls(all.names = TRUE))

# Missing packages can be installed using install.packages("<package>") in the R Console.
library(unmarked)
library(reshape2)
library(ggplot2)
# library(plyr) # plyr is included as a dependency in package unmarked.

setwd("C:/Users/Don/projects/AMRO")


# Analysis will be performed on each of these species codes via for loop
species.codes <- c("AMRO", "EABL", "SAVS", "SWSP", "FOSP");

# This for loop is an example for Tim
for(species in species.codes) {
  cat(species, "\n")
}

# This function is an example for Tim
println <- function(string) {
  cat(string, "\n")
}
println(species)

point.count <- read.csv('PC_DATA_16.csv', header=TRUE)

# Get rid of surveys from points with no planting or no maintenance due to not enough survey points
# Note for Don: in R, & is a vectorized operator. &&  form evaluates left to right examining only the first element of each vector.
point.count <- subset(point.count, point.count[,2] != "Maintenance_No_Planting"  & point.count[,2] != "No_Planting_No_Maintenance", drop=T)

# Create a column for age value and fill it
point.count$age <- 
  ifelse(point.count[, 2] == "Original_y25_1", 25,
  ifelse(point.count[, 2] == "Original_y25_2", 25,
  ifelse(point.count[, 2] == "Original_y25_3", 25,
  ifelse(point.count[, 2] == "Original_y25_4", 25,
  ifelse(point.count[, 2] == "Church_y15_3", 15,
  ifelse(point.count[, 2] == "Church_y15_2", 15,
  ifelse(point.count[, 2] == "Triangle_y15_2", 15,
  ifelse(point.count[, 2] == "Triangle_y15_1", 15,
  ifelse(point.count[, 2] == "Triangle_y7_2", 7,
  ifelse(point.count[, 2] == "Triangle_y7_1", 7,
  ifelse(point.count[, 2] == "Fox_Den_y7_2", 7,
  ifelse(point.count[, 2] == "Fox_Den_y5_1", 5,
  ifelse(point.count[, 2] == "Fox_Den_y5_2", 5,
  ifelse(point.count[, 2] == "Fox_Den_y5_3", 5,
  ifelse(point.count[, 2] == "Fox_Den_y3_1", 3,
  ifelse(point.count[, 2] == "Fox_Den_y3_2", 3,
  ifelse(point.count[, 2] == "Fox_Den_y3_3", 3,
  ifelse(point.count[, 2] == "Fox_Den_y3_4", 3,
  ifelse(point.count[, 2] == "Mowed_y0_3", 0,
  ifelse(point.count[, 2] == "Mowed_y0_4", 0,
  ifelse(point.count[, 2] == "Fox_Den_y0_1", 0,NA)))))))))))))))))))))

# Create a column called category based on the age of tree, which will be used as the block for analysis
point.count$category <-
  ifelse(
    point.count[, 2] == "Original_y25_1",
    "y25",
    ifelse(
      point.count[, 2] == "Original_y25_2",
      "y25",
      ifelse(
        point.count[, 2] == "Original_y25_3",
        "y25",
        ifelse(
          point.count[, 2] == "Original_y25_4",
          "y25",
          ifelse(
            point.count[, 2] == "Church_y15_3",
            "y15",
            ifelse(
              point.count[, 2] == "Church_y15_2",
              "y15",
              ifelse(
                point.count[, 2] == "Triangle_y15_2",
                "y15",
                ifelse(
                  point.count[, 2] == "Triangle_y15_1",
                  "y15",
                  ifelse(
                    point.count[, 2] == "Triangle_y7_2",
                    "y7",
                    ifelse(
                      point.count[, 2] == "Triangle_y7_1",
                      "y7",
                      ifelse(
                        point.count[, 2] == "Fox_Den_y7_2",
                        "y7",
                        ifelse(
                          point.count[, 2] == "Fox_Den_y5_1",
                          "y5",
                          ifelse(
                            point.count[, 2] == "Fox_Den_y5_2",
                            "y5",
                            ifelse(
                              point.count[, 2] == "Fox_Den_y5_3",
                              "y5",
                              ifelse(
                                point.count[, 2] == "Fox_Den_y3_1",
                                "y3",
                                ifelse(
                                  point.count[, 2] == "Fox_Den_y3_2",
                                  "y3",
                                  ifelse(
                                    point.count[, 2] == "Fox_Den_y3_3",
                                    "y3",
                                    ifelse(
                                      point.count[, 2] == "Fox_Den_y3_4",
                                      "y3",
                                      ifelse(
                                        point.count[, 2] == "Mowed_y0_3",
                                        "y0",
                                        ifelse(
                                          point.count[, 2] == "Mowed_y0_4",
                                          "y0",
                                          ifelse(
                                            point.count[, 2] == "Fox_Den_y0_1",
                                            "y0",
                                            ifelse(
                                              point.count[, 2] == "Forest_Interior_1",
                                              "mature",
                                              ifelse(
                                                point.count[, 2] == "Forest_Interior_2",
                                                "mature",
                                                ifelse(
                                                  point.count[, 2] == "Forest_Interior_3",
                                                  "mature",
                                                  ifelse(
                                                    point.count[, 2] == "Forest_Edge_1",
                                                    "edge",
                                                    ifelse(
                                                      point.count[, 2] == "Forest_Edge_2",
                                                      "edge",
                                                      ifelse(point.count[, 2] == "Forest_Edge_3", "edge",
                                                             
                                                             NA  )))))))))))))))))))))))))))

# Note for Don: str(foo) displays a compact form of the object
str(point.count) 

# Create a column with month data
point.count$date.char <- as.character(point.count$DATE)
point.count$date.char.sub <- substr(point.count$date.char, 0, 2)
point.count$month <- ifelse(
  point.count$date.char.sub == "9/",
  "September",
  ifelse(
    point.count$date.char.sub == "10",
    "October",
    ifelse(point.count$date.char.sub == "11", "November",
           NA)
  )
)
point.count$date.char <- NULL
point.count$date.char.sub <- NULL


# Combine all 0-11 m and 11-25m observations to make a better half normal function and even distance breaks
point.count$dist.band.num <- ifelse(point.count$Distance.Band == "0-10 m", "1",
                           ifelse(point.count$Distance.Band == "11-25 m", "1",
                                  ifelse(point.count$Distance.Band == "25-50 m", "2",
                                         ifelse(point.count$Distance.Band == ">50 m", "3",
                                                ifelse(point.count$Distance.Band == "FO", "4",
                                                       NA)))))

# Create another column with month and category as a unique identifier
point.count$block_id <- paste(point.count$category, point.count$month, sep='_')

# create one more category to identify unique surveys
point.count$survey_id <- paste(point.count$Point.Name, point.count$DATE, sep='_')

# Now I think the data are in order, but we still need to manipulate it into the pieces we want to analyze

# Make a data frame with the covariates and de-duplicate
det.covs <- point.count[,c(4:8,23:25,27:28)]
det.covs.dd = det.covs[!duplicated(det.covs), ]

# point.count.all will be all species using the area
# point.count is never referenced again after this, as such creating variable point.count.all can be omitted without ill effect
# point.count.all <- point.count


#melt count data
data.count.melt <- melt(point.count, id=c("survey_id", "dist.band.num","block_id","month","category","age","Distance.Band","Species.Code","Point.Name","DATE"), measure=c("Total.Count"), na.rm=FALSE)


###Cast count data using the sum of all sparrows seen 
# todo: Use species variable instead of string literal
count.data <- dcast(data.count.melt, survey_id ~ dist.band.num, fun.aggregate=sum, subset = .((Species.Code == "AMRO" ))) # | (Species.Code=="AMRO" ) | (Species.Code=="VEER") | (Species.Code=="SWTH") | (Species.Code=="WOTH") | (Species.Code=="EABL"))) # | (Species.Code=="SAVS") | (Species.Code=="SWSP") | (Species.Code=="FOSP"))) 
count.data[,4] <- NULL

all.birds <- merge(det.covs.dd, count.data, by= "survey_id", all=T)
all.birds[is.na(all.birds)] <- 0

all.birds.y0.September <- subset(all.birds, all.birds$block_id == "y0_September")
all.birds.y0.October <- subset(all.birds, all.birds$block_id == "y0_October")
all.birds.y0.November <- subset(all.birds, all.birds$block_id == "y0_November")

all.birds.y3.September <- subset(all.birds, all.birds$block_id == "y3_September")
all.birds.y3.October <- subset(all.birds, all.birds$block_id == "y3_October")
all.birds.y3.November <- subset(all.birds, all.birds$block_id == "y3_November")

all.birds.y5.September <- subset(all.birds, all.birds$block_id == "y5_September")
all.birds.y5.October <- subset(all.birds, all.birds$block_id == "y5_October")
all.birds.y5.November <- subset(all.birds, all.birds$block_id == "y5_November")

all.birds.y7.September <- subset(all.birds, all.birds$block_id == "y7_September")
all.birds.y7.October <- subset(all.birds, all.birds$block_id == "y7_October")
all.birds.y7.November <- subset(all.birds, all.birds$block_id == "y7_November")

all.birds.y15.September <- subset(all.birds, all.birds$block_id == "y15_September")
all.birds.y15.October <- subset(all.birds, all.birds$block_id == "y15_October")
all.birds.y15.November <- subset(all.birds, all.birds$block_id == "y15_November")

all.birds.y25.September <- subset(all.birds, all.birds$block_id == "y25_September")
all.birds.y25.October <- subset(all.birds, all.birds$block_id == "y25_October")
all.birds.y25.November <- subset(all.birds, all.birds$block_id == "y25_November")

all.birds.y25.September <- subset(all.birds, all.birds$block_id == "y25_September")
all.birds.y25.October <- subset(all.birds, all.birds$block_id == "y25_October")
all.birds.y25.November <- subset(all.birds, all.birds$block_id == "y25_November")

all.birds.edge.September <- subset(all.birds, all.birds$block_id == "edge_September")
all.birds.edge.October <- subset(all.birds, all.birds$block_id == "edge_October")
all.birds.edge.November <- subset(all.birds, all.birds$block_id == "edge_November")

all.birds.mature.September <- subset(all.birds, all.birds$block_id == "mature_September")
all.birds.mature.October <- subset(all.birds, all.birds$block_id == "mature_October")
all.birds.mature.November <- subset(all.birds, all.birds$block_id == "mature_November")

# makeumf <- function(DataIn){ 
#   
#   unmarkedFrameDS(y=as.matrix(all.birds.y0.September[,11:12]),
#                                      siteCovs=data.frame(scale(all.birds.y0.September[,3:6])),
#                                      dist.breaks=c(0,25,50), unitsIn="m", survey="point")
#   
# }

######Cat y0


all.birds.y0.September.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y0.September[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y0.September[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y0.September <- distsamp(~1 ~1, all.birds.y0.September.umf))

all.birds.y0.October.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y0.October[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y0.October[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y0.October <- distsamp(~1 ~1, all.birds.y0.October.umf))

all.birds.y0.November.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y0.November[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y0.November[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y0.November <- distsamp(~1 ~1, all.birds.y0.November.umf))




######Cat y3


all.birds.y3.September.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y3.September[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y3.September[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y3.September <- distsamp(~1 ~1, all.birds.y3.September.umf))

all.birds.y3.October.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y3.October[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y3.October[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y3.October <- distsamp(~1 ~1, all.birds.y3.October.umf))

all.birds.y3.November.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y3.November[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y3.November[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y3.November <- distsamp(~1 ~1, all.birds.y3.November.umf))



######Cat y5


all.birds.y5.September.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y5.September[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y5.September[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y5.September <- distsamp(~1 ~1, all.birds.y5.September.umf))

all.birds.y5.October.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y5.October[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y5.October[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y5.October <- distsamp(~1 ~1, all.birds.y5.October.umf))

all.birds.y5.November.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y5.November[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y5.November[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y5.November <- distsamp(~1 ~1, all.birds.y5.November.umf))



######Cat y7


all.birds.y7.September.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y7.September[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y7.September[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y7.September <- distsamp(~1 ~1, all.birds.y7.September.umf))

all.birds.y7.October.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y7.October[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y7.October[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y7.October <- distsamp(~1 ~1, all.birds.y7.October.umf))

all.birds.y7.November.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y7.November[,11:12]),
                                        siteCovs=data.frame(scale(all.birds.y7.November[,3:6])),
                                        dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y7.November <- distsamp(~1 ~1, all.birds.y7.November.umf))


######Cat y15


all.birds.y15.September.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y15.September[,11:12]),
                                         siteCovs=data.frame(scale(all.birds.y15.September[,3:6])),
                                         dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y15.September <- distsamp(~1 ~1, all.birds.y15.September.umf))

all.birds.y15.October.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y15.October[,11:12]),
                                         siteCovs=data.frame(scale(all.birds.y15.October[,3:6])),
                                         dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y15.October <- distsamp(~1 ~1, all.birds.y15.October.umf))

all.birds.y15.November.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y15.November[,11:12]),
                                         siteCovs=data.frame(scale(all.birds.y15.November[,3:6])),
                                         dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y15.November <- distsamp(~1 ~1, all.birds.y15.November.umf))



######Cat y25


all.birds.y25.September.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y25.September[,11:12]),
                                         siteCovs=data.frame(scale(all.birds.y25.September[,3:6])),
                                         dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y25.September <- distsamp(~1 ~1, all.birds.y25.September.umf))

all.birds.y25.October.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y25.October[,11:12]),
                                         siteCovs=data.frame(scale(all.birds.y25.October[,3:6])),
                                         dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y25.October <- distsamp(~1 ~1, all.birds.y25.October.umf))

all.birds.y25.November.umf <- unmarkedFrameDS(y=as.matrix(all.birds.y25.November[,11:12]),
                                         siteCovs=data.frame(scale(all.birds.y25.November[,3:6])),
                                         dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.y25.November <- distsamp(~1 ~1, all.birds.y25.November.umf))


######Cat edge


all.birds.edge.September.umf <- unmarkedFrameDS(y=as.matrix(all.birds.edge.September[,11:12]),
                                          siteCovs=data.frame(scale(all.birds.edge.September[,3:6])),
                                          dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.edge.September <- distsamp(~1 ~1, all.birds.edge.September.umf))

all.birds.edge.October.umf <- unmarkedFrameDS(y=as.matrix(all.birds.edge.October[,11:12]),
                                          siteCovs=data.frame(scale(all.birds.edge.October[,3:6])),
                                          dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.edge.October <- distsamp(~1 ~1, all.birds.edge.October.umf))

all.birds.edge.November.umf <- unmarkedFrameDS(y=as.matrix(all.birds.edge.November[,11:12]),
                                          siteCovs=data.frame(scale(all.birds.edge.November[,3:6])),
                                          dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.edge.November <- distsamp(~1 ~1, all.birds.edge.November.umf))


######Cat mature


all.birds.mature.September.umf <- unmarkedFrameDS(y=as.matrix(all.birds.mature.September[,11:12]),
                                            siteCovs=data.frame(scale(all.birds.mature.September[,3:6])),
                                            dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.mature.September <- distsamp(~1 ~1, all.birds.mature.September.umf))

all.birds.mature.October.umf <- unmarkedFrameDS(y=as.matrix(all.birds.mature.October[,11:12]),
                                            siteCovs=data.frame(scale(all.birds.mature.October[,3:6])),
                                            dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.mature.October <- distsamp(~1 ~1, all.birds.mature.October.umf))

all.birds.mature.November.umf <- unmarkedFrameDS(y=as.matrix(all.birds.mature.November[,11:12]),
                                            siteCovs=data.frame(scale(all.birds.mature.November[,3:6])),
                                            dist.breaks=c(0,25,50), unitsIn="m", survey="point")
(fm1.all.birds.mature.November <- distsamp(~1 ~1, all.birds.mature.November.umf))


#####Now read in the results data and make some graphs
# todo: where is "AMRO Results.csv" generated? We need to automate this so it can be "<species> Results.csv"
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
all.birds.results$block_id <- factor(all.birds.results$block_id, levels = c("y0_September", "y0_October", "y0_November", "y3_September", "y3_October", "y3_November", "y5_September", "y5_October", "y5_November", "y7_September", "y7_October", "y7_November", "y15_September", "y15_October", "y15_November", "y25_September", "y25_October", "y25_November", "edge_September", "edge_October", "edge_November", "mature_September", "mature_October", "mature_November") )
levels(all.birds.results$block_id)

##Now plot with ggplot2

# todo: title for ggplot from species variable, rather than string literal
p <- ggplot(data = all.birds.results, aes(x = category, y = Density, fill= month)) +
  geom_bar( stat="identity", color = "black", position=position_dodge() )+
  geom_errorbar(stat="identity", aes(x = category, ymin=Density-X95.ci, ymax=Density+X95.ci), width=.2,
                position=position_dodge(width = 1) ) +
  ggtitle("Relative Abundance of American Robins Using Areas of Different Tree
          Planting Treatments at Middle Run Valley Park in Fall 2016") +
  labs(x="Category",y="Density (birds/Ha)")

p + scale_fill_manual(values=c('darkgreen','gold', 'firebrick1'))

