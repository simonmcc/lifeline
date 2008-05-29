class CreateReferalSources < ActiveRecord::Migration
  def self.up
    create_table :referal_sources do |t|
      t.column :name,		:string
      t.column :free_text,	:boolean,	:default => 'f'
      t.column :description, 	:string
    end
  end

  def self.down
  end
end
