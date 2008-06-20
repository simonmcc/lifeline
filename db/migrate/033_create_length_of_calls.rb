class CreateLengthOfCalls < ActiveRecord::Migration
  def self.up
    create_table :length_of_calls do |t|
      t.column  :duration_text,      :string
      t.timestamps
    end
        LengthOfCall.create(:duration_text => "0-5")
        LengthOfCall.create(:duration_text => "5-10")
        LengthOfCall.create(:duration_text => "10-15")
        LengthOfCall.create(:duration_text => "15-20")
        LengthOfCall.create(:duration_text => "20-25")
        LengthOfCall.create(:duration_text => "25-30")
        LengthOfCall.create(:duration_text => "30-35")
        LengthOfCall.create(:duration_text => "35-40")
        LengthOfCall.create(:duration_text => "40-45")
        LengthOfCall.create(:duration_text => "45-60")
        LengthOfCall.create(:duration_text => "60-75")
        LengthOfCall.create(:duration_text => "75 and over")

  end

  def self.down
    drop_table :length_of_calls
  end
end
