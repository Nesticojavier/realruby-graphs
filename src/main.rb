["libGraphs/GrafoNoDirigido", "libGraphs/DFS"].each {|file| require_relative file }

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

