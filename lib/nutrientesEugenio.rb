require "nutrientesEugenio/version"



class Alimento include Comparable
    attr_reader :nombre, :grasas, :g_sat, :h_car, :azucar, :proteina, :sal
      
    def initialize(nombre, grasas, g_sat, h_car, azucar, proteina, sal)
        @nombre = nombre
        @grasas = grasas
        @g_sat = g_sat
        @h_car = h_car
        @azucar = azucar
        @proteina = proteina
        @sal = sal
    end
    
    def to_s
        "#{@nombre}:
      #{@grasas} g grasa de los cuales saturados: #{@g_sat}
      #{@h_car} g hidratos de carbono de los cuales azucares: #{@azucar}
      #{@proteina} g proteinas
      #{@sal} g sal"
    end

    
    def kcal
        @proteina * 4 + @h_car * 4 + @grasas * 9
    end
    
    def <=>(other)
        kcal <=> other.kcal
    end
    
end

