##
# Dataclass que representa una PC.
class PC
  attr_reader :brand, :model

  ##
  # Inicializa una nueva instancia de PC.
  def initialize(brand, model)
    @brand = brand
    @model = model
  end

  ##
  # Retorna una representación en forma de string de la PC como Marca: Modelo.
  def to_s
    return "#{@brand}: #{@model}"
  end

  ##
  # Retorna true si la PC es igual a otra PC, es decir, de la misma marca
  # y modelo.
  def ==(other_object)
    return false unless other_object.instance_of?(PC)
    @brand == other_object.brand && @model == other_object.model
  end
end