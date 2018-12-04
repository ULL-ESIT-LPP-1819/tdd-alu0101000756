require "nutrientesEugenio/version"


# Representación de un alimento según sus calorías aportadas y la cantidad de glucidos, proteinas y lipidos contenidos
# 
# @author Eugenio José Gonzalez Luis
# @since 1.0.0
# @attr_reader String nombre Nombre del alimento
# @attr_reader Number grasas grasas contenidas en el alimento
# @attr_reader Number g_sat grasas saturadas contenidas en el alimento
# @attr_reader Number h_car hidratos de carbono contenidos en el alimento
# @attr_reader Number azucar azucat contenidas en el alimento
# @attr_reader Number proteina proteinas saturadas contenidas en el alimento
# @attr_reader Number sal sal contenidos en el alimento
class Alimento include Comparable
    attr_reader :nombre, :grasas, :g_sat, :h_car, :azucar, :proteina, :sal
    
    # Constructor de la clase alimento
    # @param [String] nombre nombre del alimento
    # @param [Number] grasas grasas contenidas en el alimento
    # @param [Number] g_sat grasas saturadas contenidas en el alimento
    # @param [Number] h_car hidratos de carbono contenidos en el alimento
    # @param [Number] azucar azucat contenidas en el alimento
    # @param [Number] proteina proteinas saturadas contenidas en el alimento
    # @param [Number] sal sal contenidos en el alimento
    #
    # @return [Alimento] Devuelve el objeto creado de clase Alimento
    def initialize(nombre, grasas, g_sat, h_car, azucar, proteina, sal)
        @nombre = nombre
        @grasas = grasas
        @g_sat = g_sat
        @h_car = h_car
        @azucar = azucar
        @proteina = proteina
        @sal = sal
    end
    # Convierte el objeto a una cadena de caracteres
    #
    # @return [String] devuelve el alimento como un string
    def to_s
        "#{@nombre}:
      #{@grasas} g grasa de los cuales saturados: #{@g_sat}
      #{@h_car} g hidratos de carbono de los cuales azucares: #{@azucar}
      #{@proteina} g proteinas
      #{@sal} g sal"
    end

    # Calcula las calorias
    #
    # @return [Number] Valor calorico
    def kcal
        @proteina * 4 + @h_car * 4 + @grasas * 9
    end
    
    # Metodo para comparar dos alimentos
    # @param [Alimento] otro alimento a comparar
    #
    # @return [-1,0,1] -1 si es menor, 0 si son iguales, 1 si es mayor
    def <=>(other)
        kcal <=> other.kcal
    end
    
    # Metodo que clasifica alimentos segun su cantidad de sal
    #
    # @return [String] devuelve un string con la clasificación
    def cantidad_sal
       if(sal < 0.6)
           return "poca"
       else
           return "mucha"
       end
    end
    
end

