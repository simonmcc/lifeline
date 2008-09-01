class CallInSummary < ActiveRecord::Migration
  def self.up
    add_column "calls", "call_in_summary", :string
  end

  def self.down
    remove_column "calls", "call_in_summary"
  end

end
