require "nutrientesEugenio/version"



class Alimento 
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
end

