require "spec_helper"

RSpec.describe DietaDia do
    before :all do
        @menu = DietaDia.new("Lunes") do
            desayuno :descripcion => "Pan de trigo integral",
                :porcion => "1 rodaja",
                :gramos => 100,
                :grasas => 3.3,
                :carbohidratos => 54.0,
                :proteinas => 11.0,
                :fibra => 2.3,
                :sal => 0.06
            desayuno :descripcion => "Actimel",
                :porcion => "1 porcion",
                :gramos => 100,
                :grasas => 3.4,
                :carbohidratos => 4.4,
                :proteinas => 3.6,
                :sal => 0.05
            almuerzo :descripcion => "Arroz",
                :porcion => "1 taza",
                :gramos => 100,
                :grasas => 0.9,
                :carbohidratos => 81.6,
                :proteinas => 6.67,
                :fibra => 1.4,
                :sal => 0.04
            almuerzo :descripcion => "Lentejas",
                :porcion => "1/2 cucharon",
                :gramos => 100,
                :grasas => 0.4,
                :carbohidratos => 20.0,
                :proteinas => 9.0,
                :fibra => 8.0,
                :sal => 0.02
            almuerzo :descripcion => "Naranja",
                :porcion => "1 pieza",
                :gramos => 100,
                :grasas => 0.12,
                :carbohidratos => 11.75,
                :proteinas => 0.94,
                :fibra => 2.4,
                :sal => 0
            cena :descripcion => "Leche entera hacendado",
                :porcion => "1 vaso",
                :gramos => 100,
                :grasas => 3.6,
                :carbohidratos => 4.6,
                :proteinas => 3.1,
                :sal => 0.13
            end

    end
    it "Funciona" do
        puts @menu
        expect(@menu.kcal).to eq(900.0000000000001)
        expect(@menu.kcal == @menu.kcal).to eq(true)
        @a = Individuo.new("Eugenio", false, true, 73, 1.82, 25, 1)
        expect(@menu.is_enough(@a,"reposo")).to eq(false)
        @prueba = DietaDia.new("holi")
        expect(@prueba.nombre).to eq("holi")
    end
end