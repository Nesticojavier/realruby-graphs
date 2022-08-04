class GrafoNoDirigido
    
    # variable global que representa al grafo
    @@listaDeAdyacencia = Array.new(0,Array.new)
    
    #lista de objetos tipo nodo para almacenar la informacion de los mismos.
    @@nodeInfo = Array.new()
    
    def initialize
        # Por ahora, no hay variables de instanciacion
    end

    def agregarNodo(nodo)
        @@listaDeAdyacencia.append(Array.new())
        @@nodeInfo.append(nodo)
    end

    def agregarArista(arista)
        # vertificar existencia de nodos
        #TODO
        @@listaDeAdyacencia[arista.v].append(arista)
        @@listaDeAdyacencia[arista.u].append(arista.invert())
    end

    # para visualizar el grafo como lista de adyacencia
    def to_s()
        str = ""
        @@listaDeAdyacencia.each_with_index do |lista, index|
            str += "#{index} --> #{(lista.map {|arista| arista.to_s}).to_s} \n"
        end
        return str
    end

end

class Arista

    # para poder accder a los campos desde afuera
    attr_accessor :v
    attr_accessor :u

    # nodo1: int, nodo2: int
    def initialize(nodo1, nodo2)
        @v, @u = nodo1, nodo2
    end

    def invert()
        return Arista.new(@u,@v)
    end

    # representacion en string de una arista
    def to_s
        return "(#@v ,#@u)"
    end
end

class Nodo
    def initialize(param_ciudad, param_personas)
        @ciudad = param_ciudad
        @personas= param_personas
    end

    def to_s
        return "Ciudad: #@ciudad\nPersonas: #@personas"
    end
end
