require "nutrientesEugenio/version"


# Representación de un Menu dietetico
# 
# @author Eugenio Jose Gonzalez Luis
# @since 1.0.0
class DietaDia
    include Comparable
    
    attr_reader :nombre, :desayuno, :almuerzo, :cena
    
    def initialize(nombre, &bloque)
        @nombre = nombre
        @desayuno = Menu.new()
        @almuerzo = Menu.new()
        @cena = Menu.new()
        if block_given?
            if bloque.arity == 1
                yield self
            else
                instance_eval(&bloque)
            end
        end
    end
    # metodo que calcula el coste calorico de una dieta diaria
    #
    # @return [Number] Coste calorico de la dieta diaria
    def kcal
        @desayuno.kcal + @almuerzo.kcal + @cena.kcal
    end
    
    # metodo que calcula si una dieta es suficiente para un individuo dado
    # @param [Individuo] persona persona para la cual se calcula si es suficiente
    # @param [cantidad] cantidad de ejercicio que esa persona realiza
    #
    # @return [Boolean] devuelve si la dieta es o no suficiente para una persona
    def is_enough(persona, cantidad)
        x = kcal
        return (persona.gasto_energetico_total(cantidad) <= x * 1.1) && (persona.gasto_energetico_total(cantidad) >= x * 0.9)
    end
    # Metodo para comparar dos dietas
    # @param [Individuo] otra dieta a comparar
    #
    # @return [-1,0,1] -1 si es menor, 0 si son iguales, 1 si es mayor
    def <=>(other)
        kcal <=> other.kcal
    end
    
    # Convierte el objeto en un String
    # @return [String] descripción del plato en una cadena de caracteres
    def to_s
        texto = @nombre
        texto << "\n#{'=' * @nombre.size}\n"
        texto << "Composicion nutricional: \n"
        texto << @desayuno.to_s
        texto << "\n"
        texto << @almuerzo.to_s
        texto << "\n"
        texto << @cena.to_s
        texto << "\n"
        texto << "#{@kcal}"
        texto << "\n"
        return texto
    end
    
    #Añade un desayuno
    #@param options información sobre el alimento
    def desayuno(options = {})
        @desayuno.push_head(Alimento.new(options[:descripcion],options[:grasas],0,options[:carbohidratos],0,options[:proteinas],options[:sal]))
    end
    
    #Añade un almuerzo
    #@param options información sobre el alimento
    def almuerzo(options = {})
        @almuerzo.push_head(Alimento.new(options[:descripcion],options[:grasas],0,options[:carbohidratos],0,options[:proteinas],options[:sal]))
    end
    
    #Añade una cena
    #@param options información sobre el alimento
    def cena(options = {})
        @cena.push_head(Alimento.new(options[:descripcion],options[:grasas],0,options[:carbohidratos],0,options[:proteinas],options[:sal]))
    end
end