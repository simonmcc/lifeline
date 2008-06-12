class Fixclient < ActiveRecord::Migration
  def self.up
    rename_column "clients", "name", "fname"
  end

  def self.down
    rename_column "clients", "fname", "name"
  end
end
