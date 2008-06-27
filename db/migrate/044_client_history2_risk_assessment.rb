class ClientHistory2RiskAssessment < ActiveRecord::Migration
  def self.up
    rename_table "client_histories", "risk_assessments"
  end

  def self.down
    rename_table "risk_assessments", "client_histories"
  end
end
