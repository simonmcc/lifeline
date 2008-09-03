class CreateCallInTypeSubs < ActiveRecord::Migration
  def self.up
    create_table :call_in_type_subs do |t|
 t.column  :sub_text,   :string

      t.timestamps
    end
  CallInTypeSub.create(:sub_text => "Intervention required/active suicide plan or has over dosed or self harmed at that time")
  CallInTypeSub.create(:sub_text => "High level of suicidal ideation/actively considering; no plan formed")
  CallInTypeSub.create(:sub_text => "Contacts who are depressed or have experienced traumatic events (need to support to ensure no deterioration")
  CallInTypeSub.create(:sub_text => "Other-please specify")
  
  
  end

  def self.down
    drop_table :call_in_type_subs
  end
end
