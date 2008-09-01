class AddProjectId < ActiveRecord::Migration
  def self.up
    add_column "clients", "project_id", :string
    add_column "clients", "lifeline_id", :string


    
  end

  def self.down
    remove_column "clients", "project_id"
    remove_column "clients", "lifeline_id"
  end
end
