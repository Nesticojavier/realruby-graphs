["libGraphs/GrafoNoDirigido", "libGraphs/DFS"].each {|file| require_relative file }

# Formatos aceptados por el cliente
# INICIALIZAR
# AGREGAR <nodo> <ciudad> <personas>
# AGREGAR <arista> <nodo1> <nodo2>
# BUSCAR <ciudad> <personas>
# SALIR

miGrafo = GrafoNoDirigido.new

arista = Arista.new(3,2)
puts arista
puts arista.invert()

miGrafo.agregarNodo(Nodo.new("Maracay",27))
miGrafo.agregarNodo(Nodo.new("Maracay",27))
miGrafo.agregarNodo(Nodo.new("Maracay",27))
miGrafo.agregarNodo(Nodo.new("Maracay",27))
miGrafo.agregarNodo(Nodo.new("Maracay",27))
miGrafo.agregarNodo(Nodo.new("Maracay",27))
miGrafo.agregarNodo(Nodo.new("Maracay",27))
miGrafo.agregarNodo(Nodo.new("Maracay",27))
miGrafo.agregarNodo(Nodo.new("Maracay",27))
miGrafo.agregarNodo(Nodo.new("Maracay",27))




miGrafo.agregarArista(Arista.new(0,1))
miGrafo.agregarArista(Arista.new(0,2))
miGrafo.agregarArista(Arista.new(0,3))

puts miGrafo

