class AddCallLength < ActiveRecord::Migration
  def self.up
    add_column "calls", "length_of_call_id", :integer
  end

  def self.down
    remove_column "calls", "length_of_call_id"
  end
end
