require_relative "rubynetx/graph"
require_relative "rubynetx/node"
require_relative "rubynetx/dfs"
require_relative "pc"

if __FILE__ == $PROGRAM_NAME
  puts <<-BIENVENIDA
  =============================================================
  Bienvenido al registro de computadoras de la red del LDC
  donde la red está descrita por un grafo no dirigido donde se
  puede añadir y buscar computadoras en la red como nodos en el
  grafo por su marca y modelo.
  
  Las acciones permitidas despues del prompt son las siguientes:
  
  > INICIALIZAR
  
  > AGREGAR NODO <etiqueta> <marca> <modelo>
    Donde <etiqueta> es un nombre del nodo (puede ser el nombre de su usuario o
      un identificador, no debe contener espacios)
  
  > AGREGAR ARISTA <etiqueta> <etiqueta>
  
  > BUSCAR <marca> <modelo>
  =============================================================
  BIENVENIDA

  loop do
    print("LDCNetwork> ")
    input = gets.strip.split
    case input[0]
    when "INICIALIZAR"
      # Crea un nuevo grafo
      @g = Graph.new

      # Mantiene mapa de etiquetas a nodos
      @nodes = {}

      # Clase que realiza el DFS sobre el grafo
      @dfs = DFS.new(@g)
    when "AGREGAR"
      # Se atrapa una excepción si el grafo no ha sido inicializado
      begin
        case input[1]
        when "NODO"

          if input.size < 5
            puts <<~INFO
              La accion AGREGAR NODO requiere de 3 parámetros:
                <etiqueta> <marca> <modelo>
            INFO
            puts "Si introduce más parámetros, no serán considerados"
          else
            # Crea la PC y nodo con los parámetros dados
            tag = input[2]
            new_pc = PC.new(input[3],input[4])
            new_node = Node.new(tag, new_pc)

            # Agrega un nuevo nodo al grafo y al mapa de etiquetas
            @g.add_node(new_node)
            @nodes[tag] = new_node
          end

        when "ARISTA"
          if input.size < 4
            puts <<~INFO
              La accion AGREGAR ARISTA requiere de 2 parámetros:
                <etiqueta> <etiqueta>
            INFO
            puts "Si introduce más parámetros, no serán considerados"

          elsif (!@nodes.member?(input[2]) || !@nodes.member?(input[3]))
            puts "ERROR: Alguno de los nodos no pertenece al grafo"
          else
            tag1 = input[2]
            tag2 = input[3]

            # Agrega una arista entre los nodos indicados
            @g.add_edge(@nodes[tag1], @nodes[tag2])
          end

        else
          puts "Uso: AGREGAR <NODO|ARISTA> [<parámetros>]"
        end
      rescue
        puts "ERROR: No se ha creado ningún grafo"
      end

    when "BUSCAR"
      if input.size < 3
        puts <<~INFO
          La accion BUSCAR requiere de 2 parámetros:
            <marca> <modelo>
        INFO
        puts "Si introduce más parámetros, no serán considerados"
      else
        pc_to_seach = PC.new(input[1], input[2])
        @dfs.search(pc_to_search)
      end

    when "MOSTRAR"
      puts "#{@g}"

    when "SALIR"
      break

    else
      puts "ERROR: Acción inválida"

    end
  end
end