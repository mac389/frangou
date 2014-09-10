import networkx as nx
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as colors
import matplotlib.cm as cmx
filenames = {'data':'../data/fake-data.data','names':'../data/fake-data.names'}

READ = 'rb'
RED = (1,0,0,1)
adjacency_matrix = np.loadtxt(filenames['data'],dtype=float)

labels = [node_name.strip() for node_name in open(filenames['names'],READ).read().splitlines()]
network = nx.from_numpy_matrix(adjacency_matrix)
labels = {node:label for node,label in zip(network.nodes(),labels)}

positions = nx.circular_layout(network)

#-Nodes
nx.draw_networkx_nodes(network,positions,nodelist=network.nodes(),node_color='r',node_size=400)

threshold = 0.6
criterion = lambda num: abs(num)>threshold

#-Edges
jet = plt.get_cmap('binary')
cNorm = colors.Normalize(vmin=-1,vmax=1) #Dealing with correlations
scalarMap = cmx.ScalarMappable(norm=cNorm,cmap=jet)

colorList = [scalarMap.to_rgba(adjacency_matrix[i,j]) if not criterion(adjacency_matrix[i,j]) else RED for i,j in network.edges() ]
nx.draw_networkx_edges(network,positions,edge_color=colorList,width=2)

#-Labels
nx.draw_networkx_labels(network,positions,labels=labels)    
plt.axis('off')
filename = '../output/test-graph.png'
plt.savefig(filename,dpi=300)
print 'Graph saved to %s'%filename