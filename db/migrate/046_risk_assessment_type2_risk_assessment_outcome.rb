class RiskAssessmentType2RiskAssessmentOutcome < ActiveRecord::Migration
  def self.up
    rename_table "risk_assessment_types", "risk_assessment_outcomes"
  end

  def self.down
    rename_table "risk_assessment_outcomes", "risk_assessment_types"
  end
end
