class CreateLocationTrusts < ActiveRecord::Migration
  def self.up
    create_table :location_trusts do |t|
      t.timestamps
      t.column :name,	:string
    end
  end

  def self.down
    drop_table :location_trusts
  end
end
