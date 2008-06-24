class AddToLocationTrust < ActiveRecord::Migration
  def self.up

   LocationTrust.create(:name => 'Refused to give information')

  
  end

  def self.down
  
  
  
  end
end
