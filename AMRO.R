# File: AMRO.R
# Date: 1/20/2018
# Authors: Don and Tim Freiday
# Use distance sampling on point count data to predict bird abundances 
# in different ages of tree plantings. Point count data is expected
# to be in the same format as "PC_DATA_16.csv". Generates a summary csv 
# and graph for each species.

# Remove all variables from the environment.
rm(list = ls(all.names = TRUE))

# Missing packages can be installed using install.packages("<package>") in the R Console.
library(unmarked) # Fits hierarchical models of animal abundance and occurrence to data collected using survey methods
library(reshape2) # Flexibly restructure and aggregate data using just two functions: melt and 'dcast' (or 'acast').
library(ggplot2)  # A system for 'declaratively' creating graphics
library(plyr)     # Tools for splitting, applying and combining Data
library(tcltk)    # Interface and language bindings to Tcl/Tk GUI elements.

while(!file.exists("PC_DATA_16.csv")) {
  if(Sys.info()['sysname'] == "Windows") {
    print("Since you are running windows, the directory browse dialog window probably opened behind RStudio; minimize this RStudio to select a working directory.")
  }
  setwd(tk_choose.dir(default = "~", caption = "Select working directory containing PC_DATA_16.csv"))
}

# Import point count data from CSV file
point.count <- read.csv('PC_DATA_16.csv', header=TRUE)

# Get rid of surveys from points with no planting or no maintenance due to not enough survey points
# Note for Don: in R, & is a vectorized operator. &&  form evaluates left to right examining only the first element of each vector.
point.count <- subset(point.count, point.count[,2] != "Maintenance_No_Planting"  & point.count[,2] != "No_Planting_No_Maintenance", drop=T)

# Analysis will be performed on each of these species codes via for loop
# species.codes <- c("AMRO", "EABL", "SAVS", "SWSP", "YRWA");
species.codes <- unique(as.character(point.count$Species.Code))

# AOU data from Nathan L Brouwer's github: https://github.com/brouwern/wildlifeR/blob/master/data/AOU_species_codes.RData
AOU.codes <- read.csv("AOU.codes.csv")

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
  ifelse(point.count[, 2] == "Fox_Den_y0_1", 0, NA)))))))))))))))))))))

# Create a column called category based on the age of tree, which will be used as the block for analysis
point.count$category <-
  ifelse(point.count[, 2] == "Original_y25_1", "y25",
  ifelse(point.count[, 2] == "Original_y25_2", "y25",
  ifelse(point.count[, 2] == "Original_y25_3", "y25",
  ifelse(point.count[, 2] == "Original_y25_4", "y25",
  ifelse(point.count[, 2] == "Church_y15_3", "y15",
  ifelse(point.count[, 2] == "Church_y15_2", "y15",
  ifelse(point.count[, 2] == "Triangle_y15_2", "y15",
  ifelse(point.count[, 2] == "Triangle_y15_1", "y15",
  ifelse(point.count[, 2] == "Triangle_y7_2", "y7",
  ifelse(point.count[, 2] == "Triangle_y7_1", "y7",
  ifelse(point.count[, 2] == "Fox_Den_y7_2", "y7",
  ifelse(point.count[, 2] == "Fox_Den_y5_1", "y5",
  ifelse(point.count[, 2] == "Fox_Den_y5_2", "y5",
  ifelse(point.count[, 2] == "Fox_Den_y5_3", "y5",
  ifelse(point.count[, 2] == "Fox_Den_y3_1", "y3",
  ifelse(point.count[, 2] == "Fox_Den_y3_2", "y3",
  ifelse(point.count[, 2] == "Fox_Den_y3_3", "y3",
  ifelse(point.count[, 2] == "Fox_Den_y3_4", "y3",
  ifelse(point.count[, 2] == "Mowed_y0_3", "y0",
  ifelse(point.count[, 2] == "Mowed_y0_4", "y0",
  ifelse(point.count[, 2] == "Fox_Den_y0_1", "y0",
  ifelse(point.count[, 2] == "Forest_Interior_1", "mature",
  ifelse(point.count[, 2] == "Forest_Interior_2", "mature",
  ifelse(point.count[, 2] == "Forest_Interior_3", "mature",
  ifelse(point.count[, 2] == "Forest_Edge_1", "edge",
  ifelse(point.count[, 2] == "Forest_Edge_2", "edge",
  ifelse(point.count[, 2] == "Forest_Edge_3", "edge", NA)))))))))))))))))))))))))))

# Create a column with month names
point.count$month <- format(as.Date(point.count$DATE, "%m/%d/%Y"), "%B")

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
det.covs <- det.covs[!duplicated(det.covs), ]

# Melt count data
data.count.melt <- melt(point.count, id=c("survey_id", "dist.band.num","block_id","month","category","age","Distance.Band","Species.Code","Point.Name","DATE"), measure=c("Total.Count"), na.rm=FALSE)

# Iterate over species codes
for(species.code in species.codes) {
  # Look up species name in AOU.codes
  species.name <- as.character(AOU.codes[which(AOU.codes[,3] == species.code), 4])
  cat("Processing ", species.code, ":", species.name, "\n")

# Cast count data using the sum of all sparrows seen 
# todo: Use species variable instead of string literal
# Dcast reference: https://www.computerworld.com/article/2486425/business-intelligence/business-intelligence-4-data-wrangling-tasks-in-r-for-advanced-beginners.html?page=8
# Reshape2 https://cran.r-project.org/web/packages/reshape2/reshape2.pdf
count.data <- dcast(data.count.melt, survey_id ~ dist.band.num, sum, subset = .(Species.Code == species.code )) # | (Species.Code=="AMRO" ) | (Species.Code=="VEER") | (Species.Code=="SWTH") | (Species.Code=="WOTH") | (Species.Code=="EABL"))) # | (Species.Code=="SAVS") | (Species.Code=="SWSP") | (Species.Code=="FOSP"))) 

# Remove last two distance columns to subset out birds beyond 50 meters
count.data$`3` <- NULL
count.data$`4` <- NULL

# If we're missing detection columns in count.data, create them and fill with zeros
if (!("1" %in% colnames(count.data))) {
  count.data$"1" <- 0
} 
if (!("2" %in% colnames(count.data))) {
  count.data$"2" <- 0
} 


all.birds <- merge(det.covs, count.data, by= "survey_id", all=T)
all.birds[is.na(all.birds)] <- 0

# Try using block_id in State Variable
all.birds.umf <- unmarkedFrameDS(y=as.matrix(all.birds[,11:12]),
                                             siteCovs = data.frame(all.birds[,c(3:6,10)]),
                                             dist.breaks = c(0,25,50), 
                                             unitsIn = "m", 
                                             survey = "point")
output <- distsamp(~1 ~block_id, all.birds.umf)
output <- predict(output, "state", appendData=TRUE)
output[,"Species"] <- species.code

# Set months with no data to zero
# todo: this better
for (i in 1:4) {
  output[, i] <- ifelse(output$Predicted < 0.0001, 0, output[, i])
}

# Keep only abundance data, removing site covariates removing duplicate rows for display purposes.
output <- output[ , -c(5:10)]
output <- output[!duplicated(output), ]

# Create columns for category and month for display
output$category <- lapply(strsplit(output$block_id, "_"), `[`, 1)
output$month <- lapply(strsplit(output$block_id, "_"), `[`, 2)

# Manually setting ggplot levels to order by month and category for plotting
# Unlist is necessary because strsplit was used to create month and category columns
output$month <- as.factor(unlist(output$month))
output$month <- factor(output$month, levels = rev(levels(output$month)))
output$category <- as.factor(unlist(output$category))
output$category <- factor(output$category, levels = c( "y0", "y3", "y5", "y7", "y15", "y25", "edge", "mature"))
output$block_id <- as.factor(output$block_id )
output$block_id <- factor(output$block_id, levels = c("y0_September", "y0_October", "y0_November", "y3_September", "y3_October", "y3_November", "y5_September", "y5_October", "y5_November", "y7_September", "y7_October", "y7_November", "y15_September", "y15_October", "y15_November", "y25_September", "y25_October", "y25_November", "edge_September", "edge_October", "edge_November", "mature_September", "mature_October", "mature_November") )
levels(output$block_id)

write.csv(output, paste("./results/", species.code, "Results.csv"))

p <- ggplot(output, 
            aes(x = category, y = Predicted, fill= month)) +
            geom_bar( stat="identity", color = "black", position=position_dodge() ) +
            geom_errorbar(stat="identity", aes(x = category, ymin=lower, ymax=upper), width=.2, position=position_dodge(width = 1) ) +
            ggtitle(paste("Relative Abundance of ", species.name,"s Using Areas of Different Tree\nPlanting Treatments at Middle Run Valley Park in Fall 2016", sep = "")) +
            labs(x="Category", y="Density (birds/Ha)")

 p <- p + scale_fill_manual(values=c('springgreen4','gold', 'firebrick1'))
 
ggsave(p, file=paste("./results/", species.code, ".png", sep=''), scale=2)
                         
}

