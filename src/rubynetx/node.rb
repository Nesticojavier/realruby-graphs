##
# Clase que implementa un nodo de un grafo, como pares <etiqueta, valor>.
class Node
    # Etiqueta y dato que guarda el nodo
    attr_reader :tag, :value

    ##
    # Inicializa una nueva instancia de nodo.
    def initialize(tag, value)
        @tag = tag
        @value = value
    end
  
    ##
    # Construye una representación en forma de string del nodo como
    # un par <etiqueta, valor>.
    def to_s
        return "<#@tag, #@value>"
    end
  end