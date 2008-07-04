class PopulateReferalSources < ActiveRecord::Migration
  def self.up
    # Use the model to populate with data
    ReferalSource.create(:name => 'Radio Advertisement')
    ReferalSource.create(:name => 'TV Advertisement')
    ReferalSource.create(:name => 'Newspaper')
    ReferalSource.create(:name => 'Bus Advertisement')
    ReferalSource.create(:name => 'Bus Shelter (AdShel) Advertisement')
    ReferalSource.create(:name => 'Beer Mat')
    ReferalSource.create(:name => 'Toilet Door Poster')
    ReferalSource.create(:name => 'Poster/Leaflet/Card')
    ReferalSource.create(:name => 'Phone Book')
    ReferalSource.create(:name => 'Friend/Relative')
    ReferalSource.create(:name => 'Health Professional', :free_text => true)
    ReferalSource.create(:name => 'Community/Voluntary Worker', :free_text => true)
    ReferalSource.create(:name => 'Internet')
    ReferalSource.create(:name => 'School')
    ReferalSource.create(:name => 'Other', :free_text => true)
  end

  def self.down
  end
end
