class PopulateTypeOfCalls < ActiveRecord::Migration
  def self.up
    TypeOfCall.create(:category => "Hang Up", :sub_category => "")
    TypeOfCall.create(:category => "Silent Call", :sub_category => "")
    TypeOfCall.create(:category => "Wrong Number", :sub_category => "")
    TypeOfCall.create(:category => "Testing Call", :sub_category => "")
    TypeOfCall.create(:category => "New Caller", :sub_category => "Emergency Call")
    TypeOfCall.create(:category => "New Caller", :sub_category => "Risk Assessment Only Call")
    TypeOfCall.create(:category => "New Caller", :sub_category => "Risk and Full Assessment Call")
    TypeOfCall.create(:category => "New Caller", :sub_category => "Referral Only")
    TypeOfCall.create(:category => "New Caller", :sub_category => "One Off Counselling")
    TypeOfCall.create(:category => "New Caller", :sub_category => "Information Only")
  end

  def self.down
  end
end
