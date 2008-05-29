class CreateYnnas < ActiveRecord::Migration
  def self.up
    create_table :ynnas do |t|
      t.column :text,	:string
    end
  end

  def self.down
    drop_table :ynnas
  end
end
