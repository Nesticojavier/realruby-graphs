
##
# Clase que implementa la estructura de datos de grafo no dirigido
# como un mapa de adyacencias.
#
# Soporta las operaciones de agregar nodos y aristas, y buscar nodos
class Graph
  ##
  # Inicializa una nueva instancia de grafo.
  def initialize
    # Mapa de adyacencias del grafo
    @adj = {}
  end

  ##
  # Agrega un nuevo nodo al grafo.
  # Si el nodo ya existe, no se hace nada.
  #
  # :return: true si el nodo fue agregada, false en caso contrario.
  def add_node(u)
    # Verifica si el nodo ya está en el grafo, si no, lo agrega
    if self.member?(u)
      false
    else
      @adj[u] = []
      true
    end
  end

  ##
  # Agrega una arista entre los nodos u y v grafo.
  # Si alguno de los nodos no existe, se agrega al grafo.
  #
  # :return: true si la arista fue agregada, false en caso contrario
  def add_edge(u, v)
    # Agrega los nodos si no estan en el grafo
    add_node(u)
    add_node(v)

    # Agrega la arista en ambas entradas del mapa de adyacencias,
    # ya que es un grafo no dirigido
    @adj[u].append(v)
    @adj[v].append(u)
    true
  end

  ##
  # Retorna una lista con todos los nodos del grafo
  def nodes
    @adj.keys
  end

  ##
  # Retorna la lista de adyacentes al nodo u
  def adjacents(u)
    @adj[u]
  end

  ##
  # Retorna un booleano que indica la existencia de un nodo en el grafo.
  def member?(u)
    @adj.member?(u)
  end

  ##
  # Construye una representación en forma de string del grafo como
  # mapa de adyacencias, con el formato <etiqueta> --> [<valores>]
  def to_s
    str_builder = []
    @adj.each do |tag, adj_list|
        str_builder.append("#{tag} --> #{adj_list.map { |n| n.to_s }}")
    end
    return str_builder.join("\n")
  end
end