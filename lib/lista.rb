require "nutrientesEugenio/version"
# Representación de un nodo en una lista
#
# @author Eugenio Jose Gonzalez Luis
# @since 1.0.0
# @attr_accessor any value Informacion contenida en el nodo
# @attr_accessor Node next Nodo siguiente con el que esta conectado
# @attr_accessor Node prev Nodo previo con el que esta conectado
class Array
    def swap(a,b)
        self[a], self[b] = self[b], self[a]
    end
end

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
    
    # Inserción por la cabeza de la lista
    # @param [any] x valor del nuevo nodo
    #
    # @return [Node] Devuelve el head
    def push_head(x)
        if(@head == nil)
            @head = Node.new(x, nil, nil)
            @tail = @head
        else
            nuevo = Node.new(x, nil, nil)
            nuevo.next= @head
            @head.prev = nuevo
            @head = nuevo
        end
    end
    
    # Método para la enumeración de los nodos de la lista
    #
    # @return [Node] devuelve los nodos que conforman la lista
    def each
        x = @head
        while(x != nil)
            yield x.value
            x = x.next
        end
    end
    
    # Inserción por la cola de la lista
    # @param [any] x valor del nuevo nodo
    #
    # @return [Node] Devuelve el tail
    def push_tail(x)
        if(@tail == nil)
            @tail = Node.new(x, nil, nil)
            @head = @tail
        else
            nuevo = Node.new(x, nil, nil)
            nuevo.prev = @tail
            @tail.next = nuevo
            @tail = nuevo
        end
    end
    
    # Inserción por la cola de la lista de varios nodos
    # @param [Array<any>] x valores de los nuevos nodos
    #
    # @return [Node] Devuelve el tail
    def push(x)
        x.each{
            |i| push_tail(i)
        }
    end
    # Extracción del primer nodo de la lista
    #
    # @return [any, nil] devuelve el valor guardado en el primer nodo o nil si no hay nodos en la lista
    def pop_head()
        if(@head == nil)
            return nil
        end
        
        x = @head
        @head = @head.next
        if(@head == nil)
            @tail = nil
        else
            @head.prev = nil
            x.next = nil
        end
        x.value
    end
    
    # Extracción del último nodo de la lista
    #
    # @return [any, nil] devuelve el valor guardado en el último nodo o nil si no hay nodos en la lista
    def pop_tail()
        if(@tail == nil)
            return nil
        end
        
        x = @tail
        @tail = @tail.prev
        if(@tail == nil)
            @head = nil
        else
            @tail.next = nil
            x.prev = nil
        end
        x.value
    end
    
    # Ordena los alimentos en base a sus  calorias
    #
    # @return [vector] devuelve un vector ordenado por calorias
    def ordenar
        rvector = []
        j = 0
        each do
            |i| rvector[j] = i
            j +=1
        end
        begin
        intercambio = false
        (rvector.count-1).times do |i|
                if rvector[i].sal > rvector[i+1].sal  # Si se cumple la condición, entonces intercambiamos.
                        rvector.swap(i,i+1)
                        intercambio = true
                end # if
                next
        end # times
        end while intercambio == true 
        rlist = Lista.new()
        rlist.push(rvector)
        rlist
    end
    
    # Ordena los alimentos en base a un bloque
    #
    # @return [vector] devuelve un vector ordenado por el bloque dado
    def ordenar_por
        rvector = []
        j = 0
        each do
            |i| rvector[j] = i
            j +=1
        end
        begin
        intercambio = false
        (rvector.count-1).times do |i|
                x = yield rvector[i]
                y = yield rvector[i+1]
                if x > y  # Si se cumple la condición, entonces intercambiamos.
                        rvector.swap(i,i+1)
                        intercambio = true
                end # if
                next
        end # times
        end while intercambio == true 
        rlist = Lista.new()
        rlist.push(rvector)
        rlist
    end
    
    # Convierte el objeto a una cadena de caracteres
    #
    # @return [String] devuelve la lista como un string
    def to_s
        s = ""
        each {|i| s += "#{i.to_s}\n"}
        s
    end
end