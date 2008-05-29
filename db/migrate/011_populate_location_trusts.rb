class PopulateLocationTrusts < ActiveRecord::Migration
  def self.up
    LocationTrust.create(:name => 'Belfast Trust')
    LocationTrust.create(:name => 'South Eastern Trust')
    LocationTrust.create(:name => 'Northern Trust')
    LocationTrust.create(:name => 'Western Trust')
    LocationTrust.create(:name => 'Southern Trust')
    LocationTrust.create(:name => 'Outside NI - Republic of Ireland')
    LocationTrust.create(:name => 'Outside NI - Other UK Countries')
    LocationTrust.create(:name => 'Outside NI - Other')
  end

  def self.down
  end
end
