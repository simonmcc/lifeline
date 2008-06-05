class CreateTypeOfCalls < ActiveRecord::Migration
  def self.up
    create_table :type_of_calls do |t|

      t.column :category,       :string
      t.column :sub_category,   :string

      t.timestamps
    end
  end

  def self.down
    drop_table :type_of_calls
  end
end
