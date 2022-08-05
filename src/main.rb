["libGraphs/GrafoNoDirigido", "libGraphs/DFS"].each {|file| require_relative file }

# funcion auxiliar para verificar si es entero
def is_integer(a)
    return a.to_i.to_s == a
end

puts "\n************************************************************\n"+
    "Bienvenido al registro de computadoras de la red del LDC\n" +
    "donde la red está descrita por un grafo no dirigido donde se\n"+
    "puede añadir y buscar computadoras en la red como nodos en el\n"+
    "grafo por su marca y modelo.\n\n"+
    "Las acciones permitidas despues del prompt son las siguientes:\n"+
    "> INICIALIZAR\n"+
    "> AGREGAR <objeto> <param1> <param2>\n"+
    "   Si <objeto> = nodo\n"+
    "       <param1> : marca de la computadora\n"+
    "       <param1> : modelo de la computadora\n"+
    "   Si <objeto> = arista\n"+
    "       <param1> : primer nodo de la arista\n"+
    "       <param1> : segundo nodo de la arista\n"+
    "> BUSCAR <marca> <modelo>\n"+
    "*************************************************************\n\n"

    
while true
    # break
    print("> ")
    input = gets.chomp.split
    case input[0]
    when "INICIALIZAR"
        grafo = GrafoNoDirigido.new
        
        
    when "AGREGAR"
        # Se atrapa una excepcion si el grafo no ha sido inicializado
        begin
        
        case input[1]
        when "nodo"

            if input.size < 4
                puts "Debe introducir la informacion del nodo
                Parametros:
                <Marca> : Marca de la PC
                <Modelo> : Modelo de la PC"
                puts "Si introduce mas parametros, no seran considerados/"
           else
                nuevoNodo = Nodo.new(input[2],input[3])
                
                grafo.agregarNodo(nuevoNodo)
            end
            
        when "arista"
            
            if input.size < 4
                puts "Debe introducir los nodos pertenecientes a la arista
                Parametros:
                <nodo1> : primer nodo
                <nodo2> : segundo nodo"
                puts "Si introduce mas parametros, no seran considerados/"
            elsif (!is_integer(input[2]) or !is_integer(input[3]))
                puts "Error, los nodos deben ser numeros enteros"
                
            elsif (!grafo.existeNodo(input[2].to_i) or !grafo.existeNodo(input[3].to_i))
                puts "Error, alguno de los nodos no pertenece al grafo"
            else 
                arista = Arista.new(input[2].to_i, input[3].to_i)
                grafo.agregarArista(arista)
            end
            
        else
            puts "<objeto> debe ser nodo o arista."
        end
        
        rescue
            puts "El grafo no existe. Inicialize el grafo."
        end
        
    when "BUSCAR"
        # TODO
        
    when "SALIR"
        break
    else
        puts "Debe introducir de las acciones indicadas."
        
    end
end

# para visulizar como queda el grafo despues de las pruebas
puts grafo

