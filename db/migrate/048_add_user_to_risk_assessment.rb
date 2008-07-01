class AddUserToRiskAssessment < ActiveRecord::Migration
  def self.up
    add_column "risk_assessments", "user_id", :integer
  end

  def self.down
    remove_column "risk_assessments", "user_id"
  end
end
