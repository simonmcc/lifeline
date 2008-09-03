# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 56) do

  create_table "allocation_services", :force => true do |t|
    t.string   "service_text", :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "allocations", :force => true do |t|
    t.integer  "user_id",                     :default => 0
    t.integer  "client_id",                   :default => 0
    t.integer  "allocation_service_id",       :default => 0
    t.date     "date_intervention_ended"
    t.integer  "num_of_intervention_session", :default => 0
    t.string   "allocation_service_note",     :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aware_of_services", :force => true do |t|
    t.string   "awareofservices_text", :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_in_type_subs", :force => true do |t|
    t.string   "sub_text",   :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_in_types", :force => true do |t|
    t.string   "type_text",  :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_out_types", :force => true do |t|
    t.string   "name",       :default => "NULL"
    t.boolean  "freetext",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_outcomes", :force => true do |t|
    t.string   "name",       :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_outs", :force => true do |t|
    t.datetime "time_of_call"
    t.integer  "client_id",              :default => 0
    t.integer  "call_outcome_id",        :default => 0
    t.integer  "call_out_type_id",       :default => 0
    t.string   "call_out_type_freetext", :default => "NULL"
    t.string   "notes",                  :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "caller_satisfactions", :force => true do |t|
    t.string   "satisfaction_text", :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calls", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                   :default => 0
    t.boolean  "usedlifelinebefore",        :default => false
    t.boolean  "direct_call",               :default => false
    t.string   "caller_name",               :default => "''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''NULL''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
    t.integer  "client_id",                 :default => 0
    t.boolean  "understoodconfidentiality", :default => false
    t.boolean  "emergency",                 :default => false
    t.string   "contact_telephone",         :default => "''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''NULL''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
    t.boolean  "oktoidentify",              :default => false
    t.boolean  "throughfirstcall",          :default => false
    t.integer  "referal_source_id",         :default => 0
    t.string   "referal_text",              :default => "''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''NULL''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
    t.integer  "gender_id",                 :default => 0
    t.integer  "age",                       :default => 0
    t.boolean  "age_refused",               :default => false
    t.integer  "location_trust_id",         :default => 0
    t.string   "location_town_id",          :default => "''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''NULL''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
    t.string   "location_postcode",         :default => "''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''NULL''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
    t.integer  "aware_of_services_id",      :default => 0
    t.integer  "type_of_call_id",           :default => 0
    t.boolean  "furtheractionrequired",     :default => false
    t.integer  "caller_satisfaction_id",    :default => 0
    t.integer  "length_of_call_id",         :default => 0
    t.datetime "call_start_time"
    t.string   "call_in_summary"
  end

  create_table "calls_presenting_issues", :id => false, :force => true do |t|
    t.integer "call_id",             :default => 0
    t.integer "presenting_issue_id", :default => 0
  end

  create_table "clients", :force => true do |t|
    t.string  "fname",                     :default => "''NULL''"
    t.string  "sname"
    t.string  "address"
    t.string  "town"
    t.string  "post_code"
    t.string  "mobile"
    t.string  "landline"
    t.string  "fr_fname"
    t.string  "fr_sname"
    t.string  "fr_number"
    t.integer "gender_id"
    t.date    "dob"
    t.boolean "understoodconfidentiality"
    t.string  "notes"
    t.string  "rf_fname"
    t.string  "rf_sname"
    t.string  "rf_designation"
    t.string  "rf_address"
    t.string  "rf_town"
    t.string  "rf_post_code"
    t.string  "rf_number"
    t.string  "project_id"
    t.string  "lifeline_id"
  end

  create_table "followup_services", :force => true do |t|
    t.string   "name",          :default => "NULL"
    t.boolean  "freetext",      :default => false
    t.string   "freetext_desc", :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genders", :force => true do |t|
    t.string "name", :default => "NULL"
  end

  create_table "length_of_calls", :force => true do |t|
    t.string   "duration_text", :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_postcodes", :force => true do |t|
    t.string   "postcode_text", :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_towns", :force => true do |t|
    t.string   "town_text",  :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_trusts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       :default => "NULL"
  end

  create_table "presenting_issues", :force => true do |t|
    t.string "code",     :default => "NULL"
    t.string "issue",    :default => "NULL"
    t.string "category"
  end

  create_table "referal_sources", :force => true do |t|
    t.string  "name",        :default => "NULL"
    t.boolean "free_text",   :default => false
    t.string  "description", :default => "NULL"
  end

  create_table "risk_assessment_outcomes", :force => true do |t|
    t.string   "name",       :default => "NULL"
    t.boolean  "freetext",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "risk_assessment_types", :force => true do |t|
    t.string   "category",   :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "risk_assessments", :force => true do |t|
    t.integer  "client_id",                      :default => 0
    t.integer  "safety_contract_id",             :default => 0
    t.boolean  "clinical_consultation_required", :default => false
    t.integer  "followup_service_id",            :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "risk_assessment_type_id"
    t.integer  "risk_assessment_outcome_id"
    t.integer  "user_id"
    t.string   "risk_assessment_note"
  end

  create_table "safety_contracts", :force => true do |t|
    t.string   "name",       :default => "NULL"
    t.boolean  "freetext",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_of_calls", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "sub_category"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                   :default => "NULL"
    t.string   "email",                                   :default => "NULL"
    t.string   "crypted_password",          :limit => 40, :default => "NULL"
    t.string   "salt",                      :limit => 40, :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",                          :default => "NULL"
    t.datetime "remember_token_expires_at"
  end

  create_table "ynnas", :force => true do |t|
    t.string "text", :default => "NULL"
  end

end
