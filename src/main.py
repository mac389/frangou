import networkx as nx
import numpy as np
import matplotlib.pyplot as plt

filenames = {'adjacency':'../data/adj.txt'}


adjacency_matrix = np.loadtxt(filenames['adjacency'],dtype=int)
print adjacency_matrix.shape

G = nx.from_numpy_matrix(adjacency_matrix)
nx.draw_spring(G)
plt.show()