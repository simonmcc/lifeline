class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.column :name, :string
    end
  end

  def self.down
  end
end
