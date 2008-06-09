class AddCallFields < ActiveRecord::Migration
  def self.up
    add_column "calls", "furtheractionrequired", :boolean
    add_column "calls", "caller_satisfaction_id", :integer
  end

  def self.down
    remove_column "calls", "furtheractionrequired"
    remove_column "calls", "caller_satisfaction_id"
  end
end
