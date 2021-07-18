# -*- coding: utf-8 -*-
"""
Created on Sun Jul 18 09:08:23 2021

@author: Toan
"""

import networkx as nx
import matplotlib.pyplot as plt

g = nx.DiGraph()
g.add_nodes_from([1,2,3,4,5])
g.add_edge(1,2)
g.add_edge(4,2)
g.add_edge(3,5)
g.add_edge(2,3)
g.add_edge(2,5)
g.add_edge(1,4)
g.add_edge(3,4)

nx.draw(g,with_labels=True, arrows=False)
plt.draw()
plt.show()