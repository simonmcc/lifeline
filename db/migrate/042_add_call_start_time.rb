class AddCallStartTime < ActiveRecord::Migration
  def self.up
    add_column :calls, "call_start_time", :datetime
  end

  def self.down
  end
end
