class AddNoteToRiskAssessment < ActiveRecord::Migration
  def self.up
  add_column "risk_assessments", "risk_assessment_note", :string
  
  end

  def self.down
  end
end
