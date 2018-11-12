require "nutrientesEugenio/version"
# Representación de un nodo en una lista
#
# @author Eugenio Jose Gonzalez Luis
# @since 1.0.0
# @attr_accessor any value Informacion contenida en el nodo
# @attr_accessor Node next Nodo siguiente con el que esta conectado
# @attr_accessor Node prev Nodo previo con el que esta conectado
Node = Struct.new(:value, :next, :prev)

# Representación de una lista doblemente enlazada de nodos
# 
# @author Eugenio Jose Gonzalez Luis
# @since 1.0.0
# @attr_reader Node head Nodo en la cabeza de la lista
# @attr_reader Node tail Nodo en la última posición de la lista
class Lista
    include Enumerable
    attr_reader :head, :tail
    
end