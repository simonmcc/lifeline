class CreateCallOutTypes < ActiveRecord::Migration
  def self.up
    create_table :call_out_types do |t|
      t.column  :name,      :string
      t.column  :freetext,  :boolean, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :call_out_types
  end
end
