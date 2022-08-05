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

  ##
  # Busca el elemento dado en el grafo, usando el algoritmo de DFS.
  def search(el)
    @graph.nodes.each do |u|
      if !@visited.member?(u)
        if dfs_visit(u, el)
          return true
        end
      end
    end
    false
  end

  ##
  # Función de ayuda para search, parte de la implementación del algoritmo
  # de DFS.
  #
  # Visita recursivamente los nodos adyacentes de u y compara su atributo
  # value con el hasta encontrarlo.
  #
  # Imprime por salida estándar cada nodo que visita y cuando resulta exitosa
  # la búsqueda
  def dfs_visit(u, el)
    @visited.add(u)

    if u.value == el
      puts "¡Encontrado! #{u}"
      return u
    end

    puts "Visitando nodo #{u}"
    # Itera sobre todos los adyacentes y los visita recursivamente
    @graph.adjacents(u).each do |v|
      if !@visited.member?(v)
        dfs_visit(v, el) 
      end
    end

    nil
  end

  def reset
    @visited.clear
  end
end