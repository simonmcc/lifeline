class PopulateGender < ActiveRecord::Migration
  def self.up
    Gender.create(:name => 'Male')
    Gender.create(:name => 'Female')
    Gender.create(:name => 'Refused')
  end

  def self.down
  end
end
