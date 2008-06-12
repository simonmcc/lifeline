class CreateClientHistories < ActiveRecord::Migration
  def self.up
    create_table :client_histories do |t|
      t.column  "client_id",  :integer

      t.column  "suicide_assessment_id",  :integer
      t.column  "selfharm_assessment_id",  :integer
      t.column  "drugalcohol_assessment_id",  :integer
      t.column  "eatingdisorder_assessment_id",  :integer
      t.column  "safety_contract_id",  :integer
      t.column  "full_assessment_id",  :integer
      t.column  "clinical_consultation_required",  :boolean
      t.column  "followup_service_id", :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :client_histories
  end
end
