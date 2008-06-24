class CreateAwareOfServices < ActiveRecord::Migration
  def self.up
    create_table :aware_of_services do |t|
        t.column  :awareofservices_text,  :string;
      t.timestamps
    end
  
    AwareOfServices.create(:awareofservices_text => "Yes")
    AwareOfServices.create(:awareofservices_text => "No")
    AwareOfServices.create(:awareofservices_text => "Not Appropriate")
  
  end

  def self.down
    drop_table :aware_of_services
  end
end
