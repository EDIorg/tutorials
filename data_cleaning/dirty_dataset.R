
# Compile dataset for exercise

library(dplyr)
library(tidyr)

rm(list = ls())
path <- "C:\\Users\\Colin\\Documents\\EDI\\tutorials\\data_cleaning"

# Read data -------------------------------------------------------------------

ta <- read.table(paste0(path,
                        "\\",
                        "Table_A.csv"
                        ),
                 header = T,
                 sep = ",",
                 as.is = T)
tb <- read.table(paste0(path,
                        "\\",
                        "Table_B.csv"),
                 header = T,
                 sep = ",",
                 as.is = T)
tc <- read.table(paste0(path,
                        "\\",
                        "Table_C.csv"),
                 header = T,
                 sep = ",",
                 as.is = T)
td <- read.table(paste0(path,
                        "\\",
                        "Table_D.csv"),
                 header = T,
                 sep = ",",
                 as.is = T)

# Make Table 1 ----------------------------------------------------------------

glimpse(ta)
glimpse(tb)
glimpse(tc)

# Make tables bindable, then bind

ta$flag <- rep("", nrow(ta))
colnames(ta) <- c("id", "date", "temp", "rel_hum", "par", "flag")
colnames(tb) <- c("id", "date", "temp", "rel_hum", "par", "flag")
colnames(tc) <- c("id", "date", "temp", "rel_hum", "par", "flag")
t1 <- rbind(ta, tb, tc)

# Gather columns "temp", "rel_hum", "par", "flag" into "variable" and "value"

t1 <- gather(t1, 
       key = "variable",
       value = "value",
       "temp",
       "rel_hum",
       "par",
       "flag")


# Make Table 2 ----------------------------------------------------------------

# Remove repeat keys

spread(td,
       key = "characteristic",
       value = "value")























