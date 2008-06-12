class CreateRiskAssessments < ActiveRecord::Migration
  def self.up
    create_table :risk_assessments do |t|
      t.column "name", :string
      t.column "freetext", :boolean, :default => false

      t.timestamps
    end

    RiskAssessment.create(:name => "YES - no risk identified")
    RiskAssessment.create(:name => "YES - risk assessment complete")
    RiskAssessment.create(:name => "NO - follow up action agreed (time & date)", :freetext => true)
    RiskAssessment.create(:name => "NO - call ended prematurely")
    RiskAssessment.create(:name => "NO - not appropiate", :freetext => true)
  end

  def self.down
    drop_table :risk_assessments
  end
end
