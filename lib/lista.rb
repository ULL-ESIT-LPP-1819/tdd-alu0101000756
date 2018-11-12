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
    def each
        x = @head
        while(x != nil)
            yield x.value
            x = x.next
        end
    end
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
    def push(x)
        x.each{
            |i| push_tail(i)
        }
    end
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
end