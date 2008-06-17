class AddCategoryToPresentingIssues < ActiveRecord::Migration
  def self.up
    add_column "presenting_issues", "category", :string
  end

  def self.down
  end
end
