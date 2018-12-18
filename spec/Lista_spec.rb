require "spec_helper"
require 'benchmark'

RSpec.describe Lista do
  before :each do
    @nodo1 = Node.new(15, nil, nil)
    @list1 = Lista.new()
  end
  it "has a version number" do
    expect(Lista::VERSION).not_to be nil
  end
   context "Nodo" do
    it "tiene atributos value, next y prev" do
        expect(@nodo1).to have_attributes(:value => 15, :next => nil, :prev => nil)
    end
  end
  
  context "Lista" do
    it "tiene cabeza y cola" do
        expect(@list1).to have_attributes(:head => nil, :tail => nil)
    end
     it "Es enumerable" do
      @list1.push_head(15)
      @list1.push_head(10)
      x = [10, 15]
      i = 0
      @list1.each do |node|
        expect(node).to eq(x[i])
        i += 1
      end
    end
        it "puede insertar un nodo por la cabeza" do
        @list1.push_head(15)
        expect(@list1.head.value).to eq(15)
    end
        it "puede insertar un nodo por la cola" do
        @list1.push_tail(10)
        expect(@list1.tail.value).to eq(10)
    end
        it "puede insertar varios nodos" do
        @list1.push([1,2,3])
        expect(@list1.head.value).to eq(1)
        expect(@list1.head.next.value).to eq(2)
        expect(@list1.head.next.next.value).to eq(3)
    end
    it "puede extraer el nodo de la cabeza" do
        expect(@list1.pop_head).to be_nil
        @list1.push_head(5)
        expect(@list1.pop_head).to eq(5)
    end
    it "puede extraer el nodo de la cola" do
        expect(@list1.pop_tail).to be_nil
        @list1.push_head(10)
        expect(@list1.pop_tail).to eq(10)
    end
    it "puede tener alimentos como nodo" do
        @nodo2 = Alimento.new("manzana",1, 1,1,1,1,1)
        @list1.push_head(@nodo2)
        expect(@list1.pop_head.nombre).to eq("manzana")
    end
    
    it "ordena alimentos" do
        @nodo2 = Alimento.new("manzana",0.23, 0.03,19.06,14.34,0.36,0.001)
        @nodo3 = Alimento.new("pera",0.2, 0.01,25.66,16.27,0.63,0.002)
        @nodo4 = Alimento.new("Big mac",24,9.2,45,2.9,22,0.9)
        @list1.push_head(@nodo2)
        @list1.push_head(@nodo3)
        @list1.push_head(@nodo4)
        @lista2 = @list1.ordenar
        @lista2.each{
            |i| puts(i)
        }
        expect(@lista2.pop_head.sal).to eq(0.001)
    end
    it "ordena alimentos por valor de sal" do
        @nodo2 = Alimento.new("manzana",0.23, 0.03,19.06,14.34,0.36,0.001)
        @nodo3 = Alimento.new("pera",0.2, 0.01,25.66,16.27,0.63,0.002)
        @nodo4 = Alimento.new("Big mac",24,9.2,45,2.9,22,0.9)
        @list1.push_head(@nodo2)
        @list1.push_head(@nodo3)
        @list1.push_head(@nodo4)
        @lista2 = @list1.ordenar_por{ |i| i.sal}
        @lista2.each{
            |i| puts(i)
        }
        expect(@lista2.pop_head.sal).to eq(0.001)
    end
    it "clasifica por sal" do
        @nodo2 = Alimento.new("manzana",0.23, 0.03,19.06,14.34,0.36,0.001)
        @nodo3 = Alimento.new("pera",0.2, 0.01,25.66,16.27,0.63,0.002)
        @nodo4 = Alimento.new("Big mac",24,9.2,45,2.9,22,0.9)
        @list1.push_head(@nodo2)
        @list1.push_head(@nodo3)
        @list1.push_head(@nodo4)
        @list1.to_s
        expect(@list1.pop_head.cantidad_sal).to eq("mucha")
        expect(@list1.pop_head.cantidad_sal).to eq("poca")
        expect(@list1.pop_head.cantidad_sal).to eq("poca")
    end
end
    context "Es enumerable" do
        it "puede hacer los metodos de enumerable" do
            @nodo2 = Alimento.new("manzana",0.23, 0.03,19.06,14.34,0.36,0.001)
            @nodo3 = Alimento.new("pera",0.2, 0.01,25.66,16.27,0.63,0.002)
            @nodo4 = Alimento.new("Big mac",24,9.2,45,2.9,22,0.9)
            @list1.push_head(@nodo2)
            @list1.push_head(@nodo3)
            @list1.push_head(@nodo4)
            vect = []
            vect = @list1.sort
            expect(vect[0].sal).to eq(0.001)
            vect = @list1.sort_by{ |x| x.grasas}
            expect(vect[0].sal).to eq(0.002)
            alim = @list1.max
            expect(alim.sal).to eq(0.9)
            alim = @list1.min
            expect(alim.sal).to eq(0.001)
            vect = @list1.collect{ |x| x.nombre}
            expect(vect[0]).to eq("Big mac")
        end
            
    end
    context "Menu" do
        it "puede hacer los metodos de enumerable" do
            menu = Menu.new()
            @nodo4 = Alimento.new("Big mac",24,9.2,45,2.9,22,0.9)
            @a = []
            @a[0] = Individuo.new("Eugenio", false, true, 73, 1.82, 25, 1)
            @a[1] = Individuo.new("Tatiana", false, true, 54, 1.69, 20, 0)
            @a[2] = Individuo.new("Daniela", false, true, 73, 1.67, 22, 0)
            @a[3] = Individuo.new("Ghaz", false, true, 75, 1.79, 22, 1)
            @a[4] = Individuo.new("Greg", false, true, 87, 1.81, 22, 1)
            menu.push_head(@nodo4)
            menu.push_head(@nodo4)
            menu.push_head(@nodo4)
            menu.push_head(@nodo4)
            menu.push_head(@nodo4)
            puts @nodo4.kcal * 5 -1 +1
            expect(menu.is_enough(@a[0],"reposo")).to eq(false)
            expect(menu.is_enough(@a[1],"ligera")).to eq(false)
            expect(menu.is_enough(@a[2],"moderada")).to eq(true)
            expect(menu.is_enough(@a[3],"intensa")).to eq(false)
            expect(menu.is_enough(@a[4],"ligera")).to eq(true)
        end
        it "puede compararse" do
            menu = Menu.new()
            menu1 = Menu.new()
            @nodo4 = Alimento.new("Big mac",24,9.2,45,2.9,22,0.9)
            menu.push_head(@nodo4)
            menu.push_head(@nodo4)
            menu.push_head(@nodo4)
            menu.push_head(@nodo4)
            menu.push_head(@nodo4)
            menu1.push_head(@nodo4)
            expect(menu1 > menu).to eq(false)
            expect(menu1 == menu).to eq(false)
            expect(menu1 < menu).to eq(true)
        end
    end
    context "Ordenaciones array"
        before :each do
            def bubblesort_for (array)!
                for i in 0..array.size 
                    for j in i+1..array.size-1    
                        array[i], array[j] = array[j], array[i] if(array[i] > array[j])
                    end
                end
                array
            end
            def bubblesort_each (array)!
                array.each do
                    swap_count = 0
                    array.each_with_index do |a, index|
                        break if index == (array.length - 1)
                        if a > array[index + 1]
                            array[index],array[index + 1] = array[index + 1], array[index]
                            swap_count += 1
                        end
                    end
                    break if swap_count == 0
                end
                array
            end
            def bubblesort_for_lista(lista)!
                x = lista.collect{|y| y}
                bubblesort_for(x)
            end
            def bubblesort_each_lista(lista)!
                x = lista.collect{|y| y}
                bubblesort_each(x)
            end
    @nodo4 = Alimento.new("Big mac",24,9.2,45,2.9,22,0.9)
    @menu = Menu.new()
    @menu.push_head(@nodo4)
    @menu1 = @menu.dup
    @menu1.push_head(@nodo4)
    @menu2 = @menu1.dup
    @menu2.push_head(@nodo4)
    @menu3 = @menu2.dup
    @menu3.push_head(@nodo4)
    @menu4 = @menu3.dup
    @menu4.push_head(@nodo4)
    @menu5 = @menu4.dup
    @menu5.push_head(@nodo4)
    @menu6 = @menu5.dup
    @menu6.push_head(@nodo4)
    @menu7 = @menu6.dup
    @menu7.push_head(@nodo4)
    @menu8 = @menu7.dup
    @menu8.push_head(@nodo4)
    @menu9 = @menu8.dup
    @menu9.push_head(@nodo4)
    @L = [@menu,@menu1,@menu2,@menu3,@menu4,@menu5,@menu6,@menu7,@menu8,@menu9]
    @a = []
    @a[0] = Individuo.new("Eugenio", false, true, 73, 1.82, 25, 1)
    @a[1] = Individuo.new("Tatiana", false, true, 54, 1.69, 20, 0)
    @a[2] = Individuo.new("Daniela", false, true, 73, 1.67, 22, 0)
    @a[3] = Individuo.new("Ghaz", false, true, 75, 1.79, 22, 1)
    @a[4] = Individuo.new("Greg", false, true, 87, 1.81, 22, 1)
    @a[5] = Individuo.new("Eugenio", false, true, 73, 1.82, 25, 1)
    @a[6] = Individuo.new("Tatiana", false, true, 54, 1.69, 20, 0)
    @a[7] = Individuo.new("Daniela", false, true, 73, 1.67, 22, 0)
    @a[8] = Individuo.new("Ghaz", false, true, 75, 1.79, 22, 1)
    @a[9] = Individuo.new("Greg", false, true, 87, 1.81, 22, 1)
    @lista = Lista.new()
    @lista.push(@a)
  end
  
  it "Benchmark" do
    Benchmark.bmbm do |test|
      test.report("Con el metodo sort\n")  { @L.dup.sort }
      test.report("Con el metodo for\n") {bubblesort_for(@L.dup)}
      test.report("Con el metodo each \n") {bubblesort_each(@L.dup)}
      test.report("Con el metodo sort (lista) \n") {@lista.dup.sort}
      test.report("Con el metodo for (lista) \n") {bubblesort_for_lista(@lista.dup)}
      test.report("Con el metodo each (lista) \n") {bubblesort_each_lista(@lista.dup)}
    end
  end
end
#coveralls trabaja