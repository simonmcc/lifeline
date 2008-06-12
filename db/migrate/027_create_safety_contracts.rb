class CreateSafetyContracts < ActiveRecord::Migration
  def self.up
    create_table :safety_contracts do |t|
      t.column "name", :string
      t.column "freetext", :boolean, :default => false

      t.timestamps
    end

    SafetyContract.create(:name => "YES - safety contract complete")
    SafetyContract.create(:name => "NO - follow up action agreed (time & date)", :freetext => true)
    SafetyContract.create(:name => "NO - call ended prematurely")
    SafetyContract.create(:name => "NO - not appropiate", :freetext => true)
  end

  def self.down
    drop_table :safety_contracts
  end
end
