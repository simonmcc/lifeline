class CreateLocationTowns < ActiveRecord::Migration
  def self.up
    create_table :location_towns do |t|
    t.column  :town_text,  :string;
      t.timestamps
    end
            LocationTown.create(:town_text => "Antrim")
            LocationTown.create(:town_text => "Armagh")
            LocationTown.create(:town_text => "Ballycastle")
            LocationTown.create(:town_text => "Ballyclare")
            LocationTown.create(:town_text => "Ballymena")
            LocationTown.create(:town_text => "Ballymoney")
            LocationTown.create(:town_text => "Ballynahinch")
            LocationTown.create(:town_text => "Banbridge")
            LocationTown.create(:town_text => "Bangor")
            LocationTown.create(:town_text => "Belfast")
            LocationTown.create(:town_text => "Buckna")
            LocationTown.create(:town_text => "Carrickfergus")
            LocationTown.create(:town_text => "Carryduff")
            LocationTown.create(:town_text => "Coalisland")
            LocationTown.create(:town_text => "Coleraine")
            LocationTown.create(:town_text => "Comber")
            LocationTown.create(:town_text => "Cookstown")
            LocationTown.create(:town_text => "Craigavon")
            LocationTown.create(:town_text => "Derry")
            LocationTown.create(:town_text => "Donaghadee")
            LocationTown.create(:town_text => "Downpatrick")
            LocationTown.create(:town_text => "Dromore")
            LocationTown.create(:town_text => "Dundonald")
            LocationTown.create(:town_text => "Dungannon")
            LocationTown.create(:town_text => "Enniskillen")
            LocationTown.create(:town_text => "Holywood")
            LocationTown.create(:town_text => "Kilkeel")
            LocationTown.create(:town_text => "Larne")
            LocationTown.create(:town_text => "Limavady")
            LocationTown.create(:town_text => "Lisburn")
            LocationTown.create(:town_text => "Lurgan")
            LocationTown.create(:town_text => "Magherafelt")
            LocationTown.create(:town_text => "Newcastle")
            LocationTown.create(:town_text => "Newry")
            LocationTown.create(:town_text => "Newtownabbey")
            LocationTown.create(:town_text => "Newtownards")
            LocationTown.create(:town_text => "Omagh")
            LocationTown.create(:town_text => "Portadown")
            LocationTown.create(:town_text => "Portrush")
            LocationTown.create(:town_text => "Portstewart")
            LocationTown.create(:town_text => "Randalstown")
            LocationTown.create(:town_text => "Strabane")
            LocationTown.create(:town_text => "Warrenpoint")     

  end
            
  def self.down
    drop_table :location_towns
  end
end
