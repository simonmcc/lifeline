class CreateCalls < ActiveRecord::Migration
  def self.up
    create_table :calls do |t|
      t.column :created_at, 		:datetime
      t.column :updated_at, 		:datetime
      t.column :user_id, 		:integer	# the counsellor
      t.column :usedlifelinebefore, 	:boolean
      t.column :direct_call, 		:boolean
      t.column :caller_name, 		:string
      t.column :client_id,		:integer	# has_one relationship with clients table	
      t.column :understoodconfidentiality, 	:boolean
      t.column :emergency,		:boolean
      t.column :contact_telephone,	:string
      t.column :oktoidentify,		:boolean
      t.column :throughfirstcall,	:boolean
      t.column :referal_source_id,	:integer	# has_one relationship with referal table
      t.column :referal_text,		:string
      t.column :gender_id,		:integer	# has_one relationship with m|f|r
      t.column :age,			:integer
      t.column :age_refused,		:boolean
      t.column :location_trust_id,	:integer	# has_one relationship with list of trusts
      t.column :location_town,		:string
      t.column :location_postcode,	:string
      t.column :presenting_issues,	:integer	# some has_many magic will go here
      t.column :awareofservices_id,	:integer	# has_one to y|n|n/a table
      t.column :type_of_call_id,	:integer	# has_one 
    end
  end

  def self.down
    drop_table :calls
  end
end
