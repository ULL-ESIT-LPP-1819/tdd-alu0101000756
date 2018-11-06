require "spec_helper"
RSpec.describe NutrientesEugenio do
  it "has a version number" do
    expect(NutrientesEugenio::VERSION).not_to be nil
  end
  
  before :all do
    @manzana = Alimento.new("manzana")
    @pera = Alimento.new("pera")
  end

  it "does something useful" do
    expect(true).to eq(true)
  end
  
   context "Elementos básicos del alimento" do
    it "Tiene el atributo nombre" do
      expect(@manzana).to have_attributes(:nombre => "manzana")
    end
    it "Tiene un método para obtener el nombre" do
      expect(@manzana.nombre).to eq("manzana")
    end
  end
  
  
end
