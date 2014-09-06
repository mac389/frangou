library("igraph")

# trimmed output with only the most relevant graphs.

# Call graph objects:

# Calls the full graph:
source("DSMgraphs/codes/graphs/DSMgraphs_full.R")

# Calls the giant component graph:
source("DSMgraphs/codes/graphs/DSMgraphs_giant.R")

# Calls the MDEGAD1 graph:
source("DSMgraphs/codes/graphs/DSMgraphs_MDEGAD1.R")

# Calls the MDEGAD2 graph:
source("DSMgraphs/codes/graphs/DSMgraphs_MDEGAD2.R")

dev.off()

# Start output sink:
pdf("DSMgraphs/output/DSMgraphs trimmed output.pdf",width=10,height=6)

# Plots DSMgraph_full_1:
source("DSMgraphs/codes/images/DSMgraph_full_1.R")

# Plots DSMgraph_full_2:
source("DSMgraphs/codes/images/DSMgraph_full_2.R")

# Plots DSMgraph_giant_1:
source("DSMgraphs/codes/images/DSMgraph_giant_1.R")

# Plots DSMgraph_giant_2:
source("DSMgraphs/codes/images/DSMgraph_giant_2.R")

# Plots DSMgraph_full_20:
source("DSMgraphs/codes/images/DSMgraph_full_20.R")

# Plots DSMgraph_MDEGAD1_1:
source("DSMgraphs/codes/images/DSMgraph_MDEGAD1_1.R")

# Plots DSMgraph_MDEGAD2_1:
source("DSMgraphs/codes/images/DSMgraph_MDEGAD2_1.R")

# Stop sink:
dev.off()