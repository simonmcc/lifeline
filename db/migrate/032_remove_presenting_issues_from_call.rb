class RemovePresentingIssuesFromCall < ActiveRecord::Migration
  def self.up
    # This isn't needed as this is a has_and_belongs_to_many relationship
    # managed through the calls_presenting_issues table
    remove_column "calls", "presenting_issues"
  end

  def self.down
  end
end
