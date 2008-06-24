class RenameAwareOfServices < ActiveRecord::Migration
  def self.up
    rename_column "calls", "awareofservices_id", "aware_of_services_id"
  end


  def self.down
  end
end
