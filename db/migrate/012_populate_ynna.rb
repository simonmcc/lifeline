class PopulateYnna < ActiveRecord::Migration
  def self.up
    YNNA.create(:text => 'Yes')
    YNNA.create(:text => 'No')
    YNNA.create(:text => 'N/A')
  end

  def self.down
  end
end
