class TidyRiskAssessment < ActiveRecord::Migration
  def self.up
    remove_column "risk_assessments", "suicide_assessment_id"
    remove_column "risk_assessments", "selfharm_assessment_id"
    remove_column "risk_assessments", "drugalcohol_assessment_id"
    remove_column "risk_assessments", "eatingdisorder_assessment_id"
    remove_column "risk_assessments", "full_assessment_id"
    add_column "risk_assessments", "risk_assessment_type_id", :integer
    add_column "risk_assessments", "risk_assessment_outcome_id", :integer
  end

  def self.down
    add_column "risk_assessments", "suicide_assessment_id", :integer
    add_column "risk_assessments", "selfharm_assessment_id", :integer
    add_column "risk_assessments", "drugalcohol_assessment_id", :integer
    add_column "risk_assessments", "eatingdisorder_assessment_id", :integer
    add_column "risk_assessments", "full_assessment_id", :integer
    remove_column "risk_assessments", "risk_assessment_type_id"
    remove_column "risk_assessments", "risk_assessment_outcome_id"
  end
end
