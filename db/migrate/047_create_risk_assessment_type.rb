class CreateRiskAssessmentType < ActiveRecord::Migration
  def self.up
    create_table :risk_assessment_types do |t|
      t.column :category,       :string

      t.timestamps
    end

    RiskAssessmentType.create(:category => "Suicide")
    RiskAssessmentType.create(:category => "Self Harm")
    RiskAssessmentType.create(:category => "Eating Disorder")
    RiskAssessmentType.create(:category => "Drug/Alcohol")
  end

  def self.down
  end
end
