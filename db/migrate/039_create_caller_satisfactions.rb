class CreateCallerSatisfactions < ActiveRecord::Migration
  def self.up
    create_table :caller_satisfactions do |t|
      t.column  :satisfaction_text,   :string;
      t.timestamps
    end
      CallerSatisfaction.create(:satisfaction_text => "Satisfied")
      CallerSatisfaction.create(:satisfaction_text => "Neither satisfied nor dissatisfied")
      CallerSatisfaction.create(:satisfaction_text => "Dissatisfied")
      CallerSatisfaction.create(:satisfaction_text => "Not sure")
      CallerSatisfaction.create(:satisfaction_text => "Caller not asked")
 end

  def self.down
    drop_table :caller_satisfactions
  end
end
