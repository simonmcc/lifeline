class RenameLocationTown < ActiveRecord::Migration
  def self.up
    rename_column "calls", "location_town", "location_town_id"
  end

  def self.down
  end
end
