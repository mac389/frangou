library("igraph")

## This script chains several scrips to create the full output of DSMgraphs.

# Start output sink:
pdf("DSMgraphs/output/DSMgraphs full output.pdf",width=10,height=6)

# Calls the full graph:
source("DSMgraphs/codes/graphs/DSMgraphs_full.R")

# Plots DSMgraph_full_1:
source("DSMgraphs/codes/images/DSMgraph_full_1.R")

# Plots DSMgraph_full_2:
source("DSMgraphs/codes/images/DSMgraph_full_2.R")

# Plots DSMgraph_full_3:
source("DSMgraphs/codes/images/DSMgraph_full_3.R")

# Plots DSMgraph_full_4:
source("DSMgraphs/codes/images/DSMgraph_full_4.R")

# Plots DSMgraph_full_5:
source("DSMgraphs/codes/images/DSMgraph_full_5.R")

# Plots DSMgraph_full_6:
source("DSMgraphs/codes/images/DSMgraph_full_6.R")

# Plots DSMgraph_full_7:
source("DSMgraphs/codes/images/DSMgraph_full_7.R")

# Plots DSMgraph_full_8:
source("DSMgraphs/codes/images/DSMgraph_full_8.R")

# Plots DSMgraph_full_9:
source("DSMgraphs/codes/images/DSMgraph_full_9.R")

# Plots DSMgraph_full_10:
source("DSMgraphs/codes/images/DSMgraph_full_10.R")

# Plots DSMgraph_full_11:
source("DSMgraphs/codes/images/DSMgraph_full_11.R")

# Plots DSMgraph_full_12:
source("DSMgraphs/codes/images/DSMgraph_full_12.R")

# Plots DSMgraph_full_13:
source("DSMgraphs/codes/images/DSMgraph_full_13.R")

# Plots DSMgraph_full_14:
source("DSMgraphs/codes/images/DSMgraph_full_14.R")

# Plots DSMgraph_full_15:
source("DSMgraphs/codes/images/DSMgraph_full_15.R")

# Plots DSMgraph_full_16:
source("DSMgraphs/codes/images/DSMgraph_full_16.R")

# Plots DSMgraph_full_17:
source("DSMgraphs/codes/images/DSMgraph_full_17.R")

# Plots DSMgraph_full_18:
source("DSMgraphs/codes/images/DSMgraph_full_18.R")

# Plots DSMgraph_full_19:
source("DSMgraphs/codes/images/DSMgraph_full_19.R")

# Plots DSMgraph_full_20:
source("DSMgraphs/codes/images/DSMgraph_full_20.R")

# Plots DSMgraph_full_21:
source("DSMgraphs/codes/images/DSMgraph_full_21.R")

# Calls the giant component graph:
source("DSMgraphs/codes/graphs/DSMgraphs_giant.R")

# Plots DSMgraph_giant_1:
source("DSMgraphs/codes/images/DSMgraph_giant_1.R")

# Plots DSMgraph_giant_2:
source("DSMgraphs/codes/images/DSMgraph_giant_2.R")

# Plots DSMgraph_giant_3:
source("DSMgraphs/codes/images/DSMgraph_giant_3.R")

# Calls the MDEGAD1 graph:
source("DSMgraphs/codes/graphs/DSMgraphs_MDEGAD1.R")

# Plots DSMgraph_MDEGAD1_1:
source("DSMgraphs/codes/images/DSMgraph_MDEGAD1_1.R")

# Calls the MDEGAD2 graph:
source("DSMgraphs/codes/graphs/DSMgraphs_MDEGAD2.R")

# Plots DSMgraph_MDEGAD2_1:
source("DSMgraphs/codes/images/DSMgraph_MDEGAD2_1.R")

# Writes several tables and plots a scatter plot between average shortest path
# length and empirical correlation:
source("DSMgraphs/codes/images/DSMgraph_common.R")

# Stop sink:
dev.off()