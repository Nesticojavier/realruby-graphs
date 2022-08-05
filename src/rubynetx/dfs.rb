require 'set'

##
# Clase que implementa el algoritmo de búsqueda en profundidad sobre un grafo
# no dirigido
class DFS
  ##
  # Inicializa una nueva instancia de grafo.
  def initialize(graph)
    @graph = graph
    @visited = Set.new
  end

  def search(el)
    # Vacía el conjunto de visitados
    @graph.nodes.each do |u|
      if !@visited.member?(u)
        dfs_visit(u, el)
      end
    end
  end

  def dfs_visit(u, el)
    @visited.add(u)

    if u.value == el
      puts "¡Encotrado! #{u}"
      return u
    end

    puts "Visitando nodo #{u}"
    # Itera sobre todos los adyacentes y los visita recursivamente
    @graph.adjacents(u).each do |v|
      if !@visited.member?(v)
        dfs_visit(u, el)
      end
    end

    nil
  end
end