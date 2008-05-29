class CreatePresentingIssues < ActiveRecord::Migration
  def self.up
    create_table :presenting_issues do |t|
      t.column :code,	:string
      t.column :issue,	:string
    end
  end

  def self.down
  end
end
