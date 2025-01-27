# Sets
set NODES;    # Todos os nós da rede
set ARCS within {NODES, NODES};  # Todas as conexões válidas
set REFINERIES within NODES;     # Nós de origem (refinarias)
set TERMINALS within NODES;      # Nós de coletor (terminais)

# Parameters
param capacity {ARCS} >= 0;  # Capacidades de segmentos de gasodutos

# Variables
var flow {ARCS} >= 0;  # Fluxo através de cada segmento do pipeline

# Objetivo: Maximizar o fluxo total para os terminais
maximize Total_Flow: 
    sum {(i,j) in ARCS: j in TERMINALS} flow[i,j];

# Flow conservation constraints
subject to Conservation {i in NODES diff (REFINERIES union TERMINALS)}:
    sum {(j,i) in ARCS} flow[j,i] = sum {(i,j) in ARCS} flow[i,j];

# Restrições de capacidade
subject to Capacity {(i,j) in ARCS}:
    flow[i,j] <= capacity[i,j];