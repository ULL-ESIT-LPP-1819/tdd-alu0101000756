require "spec_helper"
RSpec.describe NutrientesEugenio do
  it "has a version number" do
    expect(NutrientesEugenio::VERSION).not_to be nil
  end
  
  before :all do
    @manzana = Alimento.new("manzana",1)
    @pera = Alimento.new("pera",1)
  end

  it "does something useful" do
    expect(true).to eq(true)
  end
  
   context "Elementos básicos del alimento" do
    it "Tiene el atributo nombre" do
      expect(@manzana).to have_attributes(:nombre => "manzana", :grasas => 1)
    end
    it "Tiene un método para obtener el nombre" do
      expect(@manzana.nombre).to eq("manzana")
    end
    it "tiene un metodo para obtener los gramos de grasa" do
      expect(@manzana.grasas).to eq(1)
    end
  end
  
  
end
