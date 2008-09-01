class PopulateTypeOfCalls < ActiveRecord::Migration
  def self.up
    TypeOfCall.create(:category => "New Caller Emergency Call")
    TypeOfCall.create(:category => "New Caller Risk Assessment Only Call")
    TypeOfCall.create(:category => "New Caller Risk and Full Assessment Call")
    TypeOfCall.create(:category => "New Caller Referral Only")
    TypeOfCall.create(:category => "New Caller One Off Counselling Support")
    TypeOfCall.create(:category => "New Caller Information Only")
    TypeOfCall.create(:category => "Existing Service User Emergency Call")
    TypeOfCall.create(:category => "Existing Service User Current Risk Assessment Call")
    TypeOfCall.create(:category => "Contracted Telephone Appointment")
    TypeOfCall.create(:category => "Existing Service User Staff Message/Information")
    TypeOfCall.create(:category => "Existing Service User Complaint")
    TypeOfCall.create(:category => "Third Party Emergency Call")
    TypeOfCall.create(:category => "Third Party Support Call")
    TypeOfCall.create(:category => "Third Party Referral In")
    TypeOfCall.create(:category => "Third Party Information")
    TypeOfCall.create(:category => "Third Party Complaint")
    TypeOfCall.create(:category => "Hang Up")
    TypeOfCall.create(:category => "Silent Call")
    TypeOfCall.create(:category => "Testing Call")
    TypeOfCall.create(:category => "Other")
  end

  def self.down
  end
end
