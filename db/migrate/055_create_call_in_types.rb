class CreateCallInTypes < ActiveRecord::Migration
  def self.up
    create_table :call_in_types do |t|
      t.column  :type_text, :string

      t.timestamps
    end

  CallInType.create(:type_text => "New Caller Emergency Call")
  CallInType.create(:type_text => "New Caller Risk Assessment Only Call")
  CallInType.create(:type_text=> "New Caller Risk and Full Assessment Call")
  CallInType.create(:type_text => "New Caller Referral Only")
  CallInType.create(:type_text => "New Caller One Off Counselling Support")
  CallInType.create(:type_text => "New Caller Referral Only")
  CallInType.create(:type_text => "New Caller Information Only")
  CallInType.create(:type_text => "Existing Service User Emergency Call")
  CallInType.create(:type_text => "Existing Service User Current Risk Assessment Call")
  CallInType.create(:type_text => "Contracted Telephone Appointment")
  CallInType.create(:type_text => "Existing Service User Staff Message/Information")
  CallInType.create(:type_text => "Existing Service User Complaint")
  CallInType.create(:type_text => "Third Party Emergency Call")
  CallInType.create(:type_text => "Third Party Support Call")
  CallInType.create(:type_text => "Third Party Referral In")
  CallInType.create(:type_text => "Third Party Information")
  CallInType.create(:type_text => "Third Party Complaint")
  CallInType.create(:type_text => "Hang Up")
  CallInType.create(:type_text => "Silent Call")
  CallInType.create(:type_text => "Testing Call")
  CallInType.create(:type_text => "Other")

  
  
  end

  def self.down
    drop_table :call_in_types
  end
end
