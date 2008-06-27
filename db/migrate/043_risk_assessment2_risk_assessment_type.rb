class RiskAssessment2RiskAssessmentType < ActiveRecord::Migration
  def self.up
    rename_table "risk_assessments", "risk_assessment_types"
  end

  def self.down
    rename_table "risk_assessment_types", "risk_assessments"
  end
end
