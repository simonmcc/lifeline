class CreatePresentingIssuesHabtm < ActiveRecord::Migration
  def self.up
    create_table :calls_presenting_issues, :id => false do |t|
      t.references :call
      t.references :presenting_issue
    end
  end

  def self.down
    drop_table :presenting_issues_calls
  end
end
