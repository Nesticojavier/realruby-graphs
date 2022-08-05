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
  # Retorna true si el nodo es igual a otro nodo, es decir, tienen el mismo
  # valor y etiqueta.
  def ==(other_object)
    return false unless other_object.instance_of?(Node)
    @tag == other_object.tag && @value == other_object.value
  end

  ##
  # Implementación de eql? para PC.
  def eql?(other)
    self == other
   end

  ##
  # Retorna el hash del objeto
  def hash
    @tag.hash + @value.hash
  end
  
  ##
  # Construye una representación en forma de string del nodo como
  # un par <etiqueta, valor>.
  def to_s
    return "<#@tag, #@value>"
  end
end