class CreateCallOutcomes < ActiveRecord::Migration
  def self.up
    create_table :call_outcomes do |t|
      t.column "name", :string

      t.timestamps
    end

    CallOutcome.create( :name => "NO - no answer - follow up action required")
    CallOutcome.create( :name => "NO - action not complete, identify action required")
    CallOutcome.create( :name => "YES - identify follow up action if required")
  end

  def self.down
    drop_table :call_outcomes
  end
end
