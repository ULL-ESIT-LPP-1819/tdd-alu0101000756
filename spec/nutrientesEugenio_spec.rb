require "spec_helper"
RSpec.describe NutrientesEugenio do
  it "has a version number" do
    expect(NutrientesEugenio::VERSION).not_to be nil
  end
  
  before :all do
    @manzana = Alimento.new("manzana",1, 1,1,1,1,1)
    @pera = Alimento.new("pera",1,1,1 ,1,1,1)
  end

  it "does something useful" do
    expect(true).to eq(true)
  end
  
   context "Elementos básicos del alimento" do
    it "Tiene los atributos necesarios" do
      expect(@manzana).to have_attributes(:nombre => "manzana", :grasas => 1, :g_sat => 1, :h_car => 1, :azucar => 1, :proteina =>1, :sal =>1)
    end
    it "Tiene un método para obtener el nombre" do
      expect(@manzana.nombre).to eq("manzana")
    end
    it "tiene un metodo para obtener los gramos de grasa" do
      expect(@manzana.grasas).to eq(1)
    end
    it "tiene un metodo para obtener los gramos de grasa saturada" do
      expect(@manzana.g_sat).to eq(1)
    end
    it "tiene un metodo para obtener los gramos de hidratos de carbono" do
      expect(@manzana.h_car).to eq(1)
    end
    it "tiene un metodo para obtener los gramos de azucar" do
      expect(@manzana.azucar).to eq(1)
    end
    it "tiene un metodo para obtener los gramos de proteina" do
      expect(@manzana.proteina).to eq(1)
    end
    it "tiene un metodo para obtener los gramos de sal" do
      expect(@manzana.sal).to eq(1)
    end
    it "tiene un metodo para obtener los datos formateados" do
      expect(@manzana.to_s).to eq("manzana: 1 g grasa de los cuales saturados: 1, 1 g hidratos de carbono de los cuales azucares: 1, 1 g proteinas,
       1 g sal")
    end
  end
  
  
end
