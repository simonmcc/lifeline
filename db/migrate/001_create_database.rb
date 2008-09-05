class CreateDatabase < ActiveRecord::Migration
  def self.up

    create_table :users do |t|
      t.string          :login
      t.string          :email
      t.string          :crypted_password,          :limit => 40
      t.string          :salt,                      :limit => 40
      t.string          :remember_token
      t.datetime        :remember_token_expires_at

      t.timestamps
    end

    User.create(:login=>'johnw', :email=>'johnw@sla-mobile.com', :password=>'Freddy', :password_confirmation=>'Freddy')

    create_table :ynnas do |t|
      t.string  :text
    end

    YNNA.create(:text => 'Yes')
    YNNA.create(:text => 'No')
    YNNA.create(:text => 'N/A')


    create_table :genders do |t|
      t.string  :name
    end

    Gender.create(:name => 'Male')
    Gender.create(:name => 'Female')
    Gender.create(:name => 'Refused')

    create_table :clients do |t|
      t.string          :name
      t.string          :address
      t.string          :town
      t.string          :post_code
      t.string          :mobile
      t.string          :landline
      t.string          :fr_fname
      t.string          :fr_sname
      t.string          :fr_number
      t.references      :gender
      t.date            :dob
      t.boolean         :understoodconfidentiality
      t.string          :notes
      t.string          :rf_name
      t.string          :rf_designation
      t.string          :rf_address
      t.string          :rf_town
      t.string          :rf_post_code
      t.string          :rf_number
#      t.references      :project_id
#      t.references      :lifeline_id
      t.timestamps
    end

    create_table :allocation_services do |t|
      t.string          :service_text
      t.timestamps
    end

    AllocationService.create(:service_text => "CHILL Eastern")
    AllocationService.create(:service_text => "CHILL Southern")
    AllocationService.create(:service_text => "Northern Board")
    AllocationService.create(:service_text => "Clinical Placements")
    AllocationService.create(:service_text => "Schools Programme")
    AllocationService.create(:service_text => "Lifeline Counselling")
    AllocationService.create(:service_text => "Lifeline Mentoring/Befriending")
    AllocationService.create(:service_text => "Lifeline Complimentary Therapies")


    create_table :allocations do |t|
      t.references      :user
      t.references      :client
      t.references      :allocation_service
      t.date            :date_intervention_ended
      t.integer         :num_of_intervention_session, :default => 0
      t.string          :allocation_service_note
      t.timestamps
    end

    create_table :aware_of_services do |t|
      t.string          :awareofservices_text
      t.timestamps
    end

    AwareOfServices.create(:awareofservices_text => "Yes")
    AwareOfServices.create(:awareofservices_text => "No")
    AwareOfServices.create(:awareofservices_text => "Not Appropriate")


    create_table :call_in_type_subs do |t|
      t.string          :sub_text
      t.timestamps
    end

    CallInTypeSub.create(:sub_text => "Intervention required/active suicide plan or has over dosed or self harmed at that time")
    CallInTypeSub.create(:sub_text => "High level of suicidal ideation/actively considering; no plan formed")
    CallInTypeSub.create(:sub_text => "Contacts who are depressed or have experienced traumatic events (need to support to ensure no deterioration")
    CallInTypeSub.create(:sub_text => "Other-please specify")

    create_table :call_in_types do |t|
      t.string   :type_text
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


    create_table :call_out_types do |t|
      t.string          :name
      t.boolean         :freetext
      t.timestamps
    end

    CallOutType.create(:name => "Immediate Call back to caller requested/Call Interrupted")
    CallOutType.create(:name => "Response to Third Party Referral (Call to Service User)")
    CallOutType.create(:name => "Follow up Assessment Appointment with Service User")
    CallOutType.create(:name => "Contracted check in appointment with service user")
    CallOutType.create(:name => "Contracted Telephone Appointment")
    CallOutType.create(:name => "Assessment follow up with service user")
    CallOutType.create(:name => "Assessment follow up with parent/friend/relative")
    CallOutType.create(:name => "Assessment follow up referrer ")
    CallOutType.create(:name => "Assessment follow up with GP (normal hours)")
    CallOutType.create(:name => "Assessment follow up with Social Services (normal hours)")
    CallOutType.create(:name => "Assessment follow up with Mental Health Services (normal hours)")
    CallOutType.create(:name => "Assessment follow up with GP (out of hours)")
    CallOutType.create(:name => "Assessment follow up with Social Services (out of hours)")
    CallOutType.create(:name => "Assessment follow up with Mental Health Services (out of hours)")
    CallOutType.create(:name => "Clinical Consult")
    CallOutType.create(:name => "Referral to Emergency Services")
    CallOutType.create(:name => "Referral to GP")
    CallOutType.create(:name => "Referral to Social Services")
    CallOutType.create(:name => "Referral to Other Professional", :freetext => true)
    CallOutType.create(:name => "Referral to Voluntary/Community Organisation", :freetext => true)
    CallOutType.create(:name => "Allocation follow up to LIFELINE services")


    create_table :call_outcomes do |t|
      t.string          :name
      t.timestamps
    end

    CallOutcome.create(:name => "NO - no answer - follow up action required")
    CallOutcome.create(:name => "NO - action not complete, identify action required")
    CallOutcome.create(:name => "YES - identify follow up action if required")



    create_table :call_outs do |t|
      t.datetime        :time_of_call
      t.references      :client
      t.references      :call_outcome
      t.references      :call_out_type
      t.string          :call_out_type_freetext
      t.string          :notes
      t.timestamps
    end


    create_table :caller_satisfactions do |t|
      t.string          :satisfaction_text
      t.timestamps
    end

    CallerSatisfaction.create(:satisfaction_text => "Satisfied")
    CallerSatisfaction.create(:satisfaction_text => "Neither satisfied nor dissatisfied")
    CallerSatisfaction.create(:satisfaction_text => "Dissatisfied")
    CallerSatisfaction.create(:satisfaction_text => "Not sure")
    CallerSatisfaction.create(:satisfaction_text => "Caller not asked")


    create_table :followup_services do |t|
      t.string          :name
      t.boolean         :freetext,      :default => false
      t.string          :freetext_desc
      t.timestamps
    end

    FollowupService.create(:name => "Yes - LIFELINE SERVICES Counselling", :freetext => true, :freetext_desc => "Name of counsellor/organisation, date of initial appointment")
    FollowupService.create(:name => "Yes - LIFELINE SERVICES Mentoring/Befriending", :freetext => true, :freetext_desc => "Name of counsellor/organisation, date of initial appointment")
    FollowupService.create(:name => "Yes - LIFELINE SERVICES Complimentary Therapies", :freetext => true, :freetext_desc => "Name of organisation, date of initial appointment")
    FollowupService.create(:name => "Yes - CONTACT YOUTH PROJECT", :freetext => true, :freetext_desc => "Name of project")
    FollowupService.create(:name => "Yes - referral to outside organisation/service", :freetext => true, :freetext_desc => "Name of organisation/service")
    FollowupService.create(:name => "No - follow up action agreed", :freetext => true, :freetext_desc => "time & date")
    FollowupService.create(:name => "No - no follow up required", :freetext => true, :freetext_desc =>  "reason")


    create_table :length_of_calls do |t|
      t.string          :duration_text
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


    create_table :location_postcodes do |t|
      t.string          :postcode_text
      t.timestamps
    end

    LocationPostcode.create(:postcode_text => "BT1")
    LocationPostcode.create(:postcode_text => "BT2")
    LocationPostcode.create(:postcode_text => "BT3")
    LocationPostcode.create(:postcode_text => "BT4")
    LocationPostcode.create(:postcode_text => "BT5")
    LocationPostcode.create(:postcode_text => "BT6")
    LocationPostcode.create(:postcode_text => "BT7")
    LocationPostcode.create(:postcode_text => "BT8")
    LocationPostcode.create(:postcode_text => "BT9")
    LocationPostcode.create(:postcode_text => "BT10")
    LocationPostcode.create(:postcode_text => "BT11")
    LocationPostcode.create(:postcode_text => "BT12")
    LocationPostcode.create(:postcode_text => "BT13")
    LocationPostcode.create(:postcode_text => "BT14")
    LocationPostcode.create(:postcode_text => "BT15")
    LocationPostcode.create(:postcode_text => "BT16")
    LocationPostcode.create(:postcode_text => "BT17")
    LocationPostcode.create(:postcode_text => "BT18")
    LocationPostcode.create(:postcode_text => "BT19")
    LocationPostcode.create(:postcode_text => "BT20")
    LocationPostcode.create(:postcode_text => "BT21")
    LocationPostcode.create(:postcode_text => "BT22")
    LocationPostcode.create(:postcode_text => "BT23")
    LocationPostcode.create(:postcode_text => "BT24")
    LocationPostcode.create(:postcode_text => "BT25")
    LocationPostcode.create(:postcode_text => "BT26")
    LocationPostcode.create(:postcode_text => "BT27")
    LocationPostcode.create(:postcode_text => "BT28")
    LocationPostcode.create(:postcode_text => "BT29")
    LocationPostcode.create(:postcode_text => "BT30")
    LocationPostcode.create(:postcode_text => "BT31")
    LocationPostcode.create(:postcode_text => "BT32")
    LocationPostcode.create(:postcode_text => "BT33")
    LocationPostcode.create(:postcode_text => "BT34")
    LocationPostcode.create(:postcode_text => "BT35")
    LocationPostcode.create(:postcode_text => "BT36")
    LocationPostcode.create(:postcode_text => "BT37")
    LocationPostcode.create(:postcode_text => "BT38")
    LocationPostcode.create(:postcode_text => "BT39")
    LocationPostcode.create(:postcode_text => "BT40")
    LocationPostcode.create(:postcode_text => "BT41")
    LocationPostcode.create(:postcode_text => "BT42")
    LocationPostcode.create(:postcode_text => "BT43")
    LocationPostcode.create(:postcode_text => "BT44")
    LocationPostcode.create(:postcode_text => "BT45")
    LocationPostcode.create(:postcode_text => "BT46")
    LocationPostcode.create(:postcode_text => "BT47")
    LocationPostcode.create(:postcode_text => "BT48")
    LocationPostcode.create(:postcode_text => "BT49")
    LocationPostcode.create(:postcode_text => "BT50")
    LocationPostcode.create(:postcode_text => "BT51")
    LocationPostcode.create(:postcode_text => "BT52")
    LocationPostcode.create(:postcode_text => "BT53")
    LocationPostcode.create(:postcode_text => "BT54")
    LocationPostcode.create(:postcode_text => "BT55")
    LocationPostcode.create(:postcode_text => "BT56")
    LocationPostcode.create(:postcode_text => "BT57")
    LocationPostcode.create(:postcode_text => "BT58")
    LocationPostcode.create(:postcode_text => "BT59")
    LocationPostcode.create(:postcode_text => "BT60")
    LocationPostcode.create(:postcode_text => "BT61")
    LocationPostcode.create(:postcode_text => "BT62")
    LocationPostcode.create(:postcode_text => "BT63")
    LocationPostcode.create(:postcode_text => "BT64")
    LocationPostcode.create(:postcode_text => "BT65")
    LocationPostcode.create(:postcode_text => "BT66")
    LocationPostcode.create(:postcode_text => "BT67")
    LocationPostcode.create(:postcode_text => "BT68")
    LocationPostcode.create(:postcode_text => "BT69")
    LocationPostcode.create(:postcode_text => "BT70")
    LocationPostcode.create(:postcode_text => "BT71")
    LocationPostcode.create(:postcode_text => "BT72")
    LocationPostcode.create(:postcode_text => "BT73")
    LocationPostcode.create(:postcode_text => "BT74")
    LocationPostcode.create(:postcode_text => "BT75")
    LocationPostcode.create(:postcode_text => "BT76")
    LocationPostcode.create(:postcode_text => "BT77")
    LocationPostcode.create(:postcode_text => "BT78")
    LocationPostcode.create(:postcode_text => "BT79")
    LocationPostcode.create(:postcode_text => "BT80")
    LocationPostcode.create(:postcode_text => "BT81")
    LocationPostcode.create(:postcode_text => "BT82")
    LocationPostcode.create(:postcode_text => "BT83")
    LocationPostcode.create(:postcode_text => "BT84")
    LocationPostcode.create(:postcode_text => "BT85")
    LocationPostcode.create(:postcode_text => "BT86")
    LocationPostcode.create(:postcode_text => "BT87")
    LocationPostcode.create(:postcode_text => "BT88")
    LocationPostcode.create(:postcode_text => "BT89")
    LocationPostcode.create(:postcode_text => "BT90")
    LocationPostcode.create(:postcode_text => "BT91")
    LocationPostcode.create(:postcode_text => "BT92")
    LocationPostcode.create(:postcode_text => "BT93")
    LocationPostcode.create(:postcode_text => "BT94")
    LocationPostcode.create(:postcode_text => "BT95")
    LocationPostcode.create(:postcode_text => "BT96")
    LocationPostcode.create(:postcode_text => "BT97")
    LocationPostcode.create(:postcode_text => "BT98")
    LocationPostcode.create(:postcode_text => "BT99")


    create_table :location_towns do |t|
      t.string          :town_text
      t.timestamps
    end

    LocationTown.create(:town_text => "Antrim")
    LocationTown.create(:town_text => "Armagh")
    LocationTown.create(:town_text => "Ballycastle")
    LocationTown.create(:town_text => "Ballyclare")
    LocationTown.create(:town_text => "Ballymena")
    LocationTown.create(:town_text => "Ballymoney")
    LocationTown.create(:town_text => "Ballynahinch")
    LocationTown.create(:town_text => "Banbridge")
    LocationTown.create(:town_text => "Bangor")
    LocationTown.create(:town_text => "Belfast")
    LocationTown.create(:town_text => "Buckna")
    LocationTown.create(:town_text => "Carrickfergus")
    LocationTown.create(:town_text => "Carryduff")
    LocationTown.create(:town_text => "Coalisland")
    LocationTown.create(:town_text => "Coleraine")
    LocationTown.create(:town_text => "Comber")
    LocationTown.create(:town_text => "Cookstown")
    LocationTown.create(:town_text => "Craigavon")
    LocationTown.create(:town_text => "Derry")
    LocationTown.create(:town_text => "Donaghadee")
    LocationTown.create(:town_text => "Downpatrick")
    LocationTown.create(:town_text => "Dromore")
    LocationTown.create(:town_text => "Dundonald")
    LocationTown.create(:town_text => "Dungannon")
    LocationTown.create(:town_text => "Enniskillen")
    LocationTown.create(:town_text => "Holywood")
    LocationTown.create(:town_text => "Kilkeel")
    LocationTown.create(:town_text => "Larne")
    LocationTown.create(:town_text => "Limavady")
    LocationTown.create(:town_text => "Lisburn")
    LocationTown.create(:town_text => "Lurgan")
    LocationTown.create(:town_text => "Magherafelt")
    LocationTown.create(:town_text => "Newcastle")
    LocationTown.create(:town_text => "Newry")
    LocationTown.create(:town_text => "Newtownabbey")
    LocationTown.create(:town_text => "Newtownards")
    LocationTown.create(:town_text => "Omagh")
    LocationTown.create(:town_text => "Portadown")
    LocationTown.create(:town_text => "Portrush")
    LocationTown.create(:town_text => "Portstewart")
    LocationTown.create(:town_text => "Randalstown")
    LocationTown.create(:town_text => "Strabane")
    LocationTown.create(:town_text => "Warrenpoint")


    create_table :location_trusts do |t|
      t.string          :name
      t.timestamps
    end

    LocationTrust.create(:name => 'Belfast Trust')
    LocationTrust.create(:name => 'South Eastern Trust')
    LocationTrust.create(:name => 'Northern Trust')
    LocationTrust.create(:name => 'Western Trust')
    LocationTrust.create(:name => 'Southern Trust')
    LocationTrust.create(:name => 'Outside NI - Republic of Ireland')
    LocationTrust.create(:name => 'Outside NI - Other UK Countries')
    LocationTrust.create(:name => 'Outside NI - Other')
    LocationTrust.create(:name => 'Refused to give information')


    create_table :presenting_issues do |t|
      t.string          :code
      t.string          :issue
      t.string          :category
    end

    PresentingIssue.create(:code => '1.04', :issue => 'Abortion')
    PresentingIssue.create(:code => '1.05', :issue => 'Adoption')
    PresentingIssue.create(:code => '1.06', :issue => 'Anger')
    PresentingIssue.create(:code => '1.07', :issue => 'Anxiety')
    PresentingIssue.create(:code => '1.08', :issue => 'Bereavement')
    PresentingIssue.create(:code => '1.09', :issue => 'Carer Responsibilities')
    PresentingIssue.create(:code => '1.1', :issue => 'Depression')
    PresentingIssue.create(:code => '1.11', :issue => 'Domestic Violence')
    PresentingIssue.create(:code => '1.12', :issue => 'Eating Issues')
    PresentingIssue.create(:code => '1.13', :issue => 'Family Conflict')
    PresentingIssue.create(:code => '1.14', :issue => 'Family Illness')
    PresentingIssue.create(:code => '1.15', :issue => 'Family Breakdown')
    PresentingIssue.create(:code => '1.16', :issue => 'Gambling')
    PresentingIssue.create(:code => '1.17', :issue => 'Health - Physical')
    PresentingIssue.create(:code => '1.18', :issue => 'Health - Mental')
    PresentingIssue.create(:code => '1.19', :issue => 'Housing - General')
    PresentingIssue.create(:code => '1.2', :issue => 'Housing - Being in Care')
    PresentingIssue.create(:code => '1.21', :issue => 'Isolation')
    PresentingIssue.create(:code => '1.22', :issue => 'Information')
    PresentingIssue.create(:code => '1.23', :issue => 'Leaving Home')
    PresentingIssue.create(:code => '1.24', :issue => 'Neglect')
    PresentingIssue.create(:code => '1.25', :issue => 'Obesity')
    PresentingIssue.create(:code => '1.26', :issue => 'Obsessive Compulsive Disorder')
    PresentingIssue.create(:code => '1.27', :issue => 'Panic Attacks')
    PresentingIssue.create(:code => '1.28', :issue => 'Pregnancy')
    PresentingIssue.create(:code => '1.29', :issue => 'Racism')
    PresentingIssue.create(:code => '1.3', :issue => 'Rape')
    PresentingIssue.create(:code => '1.31', :issue => 'Relationships')
    PresentingIssue.create(:code => '1.32', :issue => 'Relationship with Parent/Carer')
    PresentingIssue.create(:code => '1.33', :issue => 'Self Esteem')
    PresentingIssue.create(:code => '1.34', :issue => 'Self Harm')
    PresentingIssue.create(:code => '1.35', :issue => 'Sexual Health')
    PresentingIssue.create(:code => '1.36', :issue => 'Sexuality')
    PresentingIssue.create(:code => '1.37', :issue => 'Suicide ')
    PresentingIssue.create(:code => '1.38', :issue => 'Suicide - Concerned about')
    PresentingIssue.create(:code => '1.39', :issue => 'Unemployed')
    PresentingIssue.create(:code => '1.4', :issue => 'Victim of Violence')
    PresentingIssue.create(:code => '1.41', :issue => 'Traumatic Bereavement')
    PresentingIssue.create(:code => '1.42', :issue => 'Suicidal Bereavement')
    PresentingIssue.create(:code => '1.44', :issue => 'Concerned about Self Harm')
    PresentingIssue.create(:code => '2.01', :issue => 'Absence/Attendance')
    PresentingIssue.create(:code => '2.02', :issue => 'Bullying')
    PresentingIssue.create(:code => '2.03', :issue => 'Changes at School')
    PresentingIssue.create(:code => '2.04', :issue => 'Career')
    PresentingIssue.create(:code => '2.05', :issue => 'Disciplinary')
    PresentingIssue.create(:code => '2.06', :issue => 'Exam Pressure')
    PresentingIssue.create(:code => '2.07', :issue => 'Hate School')
    PresentingIssue.create(:code => '2.08', :issue => 'Relationship with Teacher')
    PresentingIssue.create(:code => '3.01', :issue => 'Beer/Lager')
    PresentingIssue.create(:code => '3.02', :issue => 'Spirits')
    PresentingIssue.create(:code => '3.03', :issue => 'Amphetamines')
    PresentingIssue.create(:code => '3.04', :issue => 'Cannabis')
    PresentingIssue.create(:code => '3.05', :issue => 'Cocaine')
    PresentingIssue.create(:code => '3.06', :issue => 'Ecstacy')
    PresentingIssue.create(:code => '3.07', :issue => 'Heroin')
    PresentingIssue.create(:code => '3.08', :issue => 'LSD')
    PresentingIssue.create(:code => '3.09', :issue => 'Prescription')
    PresentingIssue.create(:code => '3.1', :issue => 'Over The Counter Meds')
    PresentingIssue.create(:code => '3.11', :issue => 'Solvents')
    PresentingIssue.create(:code => '3.13', :issue => 'Friend')
    PresentingIssue.create(:code => '3.14', :issue => 'Parents/ Family')
    PresentingIssue.create(:code => '4.01', :issue => 'Bereaved')
    PresentingIssue.create(:code => '4.02', :issue => 'Emotionally injured')
    PresentingIssue.create(:code => '4.03', :issue => 'Physically injured')
    PresentingIssue.create(:code => '4.04', :issue => 'Witness')
    PresentingIssue.create(:code => '5.01', :issue => 'Joy Riding')
    PresentingIssue.create(:code => '5.02', :issue => 'Violent Behaviour')
    PresentingIssue.create(:code => '5.03', :issue => 'Theft')
    PresentingIssue.create(:code => '5.04', :issue => 'Other (please specify):')
    PresentingIssue.create(:code => '5.05', :issue => 'Involvement with Probation')
    PresentingIssue.create(:code => '5.06', :issue => 'Involvement with Juvenile Justice')
    PresentingIssue.create(:code => '5.07', :issue => 'Trauma')
    PresentingIssue.create(:code => '5.08', :issue => 'Homelessness')

    # Find each of the categories & assign the correct category
    personalissues = PresentingIssue.find(:all, :conditions => ["code LIKE ?", '1%'])
    personalissues.each {|i| i.category = "Personal Issues" ; i.save}
    stwi = PresentingIssue.find(:all, :conditions => ["code LIKE ?", '2%'])
    stwi.each {|i| i.category = "School/Training/Work Issues" ; i.save}
    sm = PresentingIssue.find(:all, :conditions => ["code LIKE ?", '3%'])
    sm.each {|i| i.category = "Substance Misuse" ; i.save}
    nic = PresentingIssue.find(:all, :conditions => ["code LIKE ?", '4%'])
    nic.each {|i| i.category = "Victims of the NI Conflict" ; i.save}
    other = PresentingIssue.find(:all, :conditions => ["code LIKE ?", '5%'])
    other.each {|i| i.category = "Other" ; i.save}


    create_table :referal_sources do |t|
      t.string          :name
      t.boolean         :free_text,   :default => false
      t.string          :description
    end

    ReferalSource.create(:name => 'Radio Advertisement')
    ReferalSource.create(:name => 'TV Advertisement')
    ReferalSource.create(:name => 'Newspaper')
    ReferalSource.create(:name => 'Bus Advertisement')
    ReferalSource.create(:name => 'Bus Shelter (AdShel) Advertisement')
    ReferalSource.create(:name => 'Beer Mat')
    ReferalSource.create(:name => 'Toilet Door Poster')
    ReferalSource.create(:name => 'Poster/Leaflet/Card')
    ReferalSource.create(:name => 'Phone Book')
    ReferalSource.create(:name => 'Friend/Relative')
    ReferalSource.create(:name => 'Health Professional', :free_text => true)
    ReferalSource.create(:name => 'Community/Voluntary Worker', :free_text => true)
    ReferalSource.create(:name => 'Internet')
    ReferalSource.create(:name => 'School')
    ReferalSource.create(:name => 'Other', :free_text => true)

    create_table :calls do |t|
      t.references      :user
      t.boolean         :usedlifelinebefore
      t.boolean         :direct_call
      t.string          :caller_name
      t.references      :client
      t.boolean         :understoodconfidentiality
      t.boolean         :emergency
      t.string          :contact_telephone
      t.boolean         :oktoidentify
      t.boolean         :throughfirstcall
      t.references      :referal_source
      t.string          :referal_text
      t.references      :gender
      t.integer         :age
      t.boolean         :age_refused
      t.references      :location_trust
      t.references      :location_town
      t.references      :location_postcode
      t.references      :aware_of_services
      t.references      :call_in_type
      t.references      :call_in_type_sub
      t.boolean         :furtheractionrequired
      t.references      :caller_satisfaction
      t.references      :length_of_call
      t.datetime        :call_start_time
      t.string          :call_in_summary
      t.timestamps
    end

    create_table :calls_presenting_issues, :id => false do |t|
      t.integer         :call_id,             :default => 0
      t.references      :presenting_issue
    end

    create_table :risk_assessment_outcomes do |t|
      t.string          :name
      t.boolean         :freetext,   :default => false
      t.timestamps
    end

    RiskAssessmentOutcome.create(:name => "YES - no risk identified")
    RiskAssessmentOutcome.create(:name => "YES - risk assessment complete")
    RiskAssessmentOutcome.create(:name => "NO - follow up action agreed (time & date)", :freetext => true)
    RiskAssessmentOutcome.create(:name => "NO - call ended prematurely")
    RiskAssessmentOutcome.create(:name => "NO - not appropiate", :freetext => true)


    create_table :risk_assessment_types do |t|
      t.string          :category
      t.timestamps
    end

    RiskAssessmentType.create(:category => "Suicide")
    RiskAssessmentType.create(:category => "Self Harm")
    RiskAssessmentType.create(:category => "Eating Disorder")
    RiskAssessmentType.create(:category => "Drug/Alcohol")


    create_table :safety_contracts do |t|
      t.string          :name
      t.boolean         :freetext,   :default => false

      t.timestamps
    end

    SafetyContract.create(:name => "YES - safety contract complete")
    SafetyContract.create(:name => "NO - follow up action agreed (time & date)", :freetext => true)
    SafetyContract.create(:name => "NO - call ended prematurely")
    SafetyContract.create(:name => "NO - not appropiate", :freetext => true)


    create_table :risk_assessments do |t|
      t.references      :client
      t.references      :safety_contract
      t.boolean         :clinical_consultation_required
      t.references      :followup_service
      t.references      :risk_assessment_type
      t.references      :risk_assessment_outcome
      t.references      :user
      t.string          :risk_assessment_note

      t.timestamps
    end

    if false
      # Add constraints for postgres
      execute "ALTER TABLE clients ADD CONSTRAINT c_gender_fkey FOREIGN KEY (gender_id) REFERENCES genders (id) MATCH FULL"
      execute "ALTER TABLE allocations ADD CONSTRAINT c_client_fkey FOREIGN KEY (client_id) REFERENCES clients (id) MATCH FULL"
      execute "ALTER TABLE allocations ADD CONSTRAINT c_user_fkey FOREIGN KEY (user_id) REFERENCES users (id) MATCH FULL"
      execute "ALTER TABLE call_outs ADD CONSTRAINT c_client_fkey FOREIGN KEY (client_id) REFERENCES clients (id) MATCH FULL"
      execute "ALTER TABLE call_outs ADD CONSTRAINT c_call_outcome_fkey FOREIGN KEY (call_outcome_id) REFERENCES call_outcomes (id) MATCH FULL"
      execute "ALTER TABLE call_outs ADD CONSTRAINT c_call_out_type_fkey FOREIGN KEY (call_out_type_id) REFERENCES call_out_types (id) MATCH FULL"
      execute "ALTER TABLE calls ADD CONSTRAINT c_client_fkey FOREIGN KEY (client_id) REFERENCES clients (id) MATCH FULL"
      execute "ALTER TABLE calls ADD CONSTRAINT c_user_fkey FOREIGN KEY (user_id) REFERENCES users (id) MATCH FULL"
      execute "ALTER TABLE calls ADD CONSTRAINT c_referal_source_fkey FOREIGN KEY (referal_source_id) REFERENCES referal_sources (id) MATCH FULL"
      execute "ALTER TABLE calls ADD CONSTRAINT c_gender_fkey FOREIGN KEY (gender_id) REFERENCES genders (id) MATCH FULL"
      execute "ALTER TABLE calls ADD CONSTRAINT c_location_trust_fkey FOREIGN KEY (location_trust_id) REFERENCES location_trusts (id) MATCH FULL"
      execute "ALTER TABLE calls ADD CONSTRAINT c_location_town_fkey FOREIGN KEY (location_town_id) REFERENCES location_towns (id) MATCH FULL"
      execute "ALTER TABLE calls ADD CONSTRAINT c_aware_of_services_fkey FOREIGN KEY (aware_of_services_id) REFERENCES aware_of_services (id) MATCH FULL"
      execute "ALTER TABLE calls ADD CONSTRAINT c_type_of_call_fkey FOREIGN KEY (type_of_call_id) REFERENCES type_of_calls (id) MATCH FULL"
      execute "ALTER TABLE calls ADD CONSTRAINT c_caller_satisfaction_fkey FOREIGN KEY (caller_satisfaction_id) REFERENCES caller_satisfactions (id) MATCH FULL"
      execute "ALTER TABLE calls ADD CONSTRAINT c_length_of_call_fkey FOREIGN KEY (length_of_call_id) REFERENCES length_of_calls (id) MATCH FULL"
      execute "ALTER TABLE calls_presenting_issues ADD CONSTRAINT c_call_fkey FOREIGN KEY (call_id) REFERENCES calls (id) MATCH FULL"
      execute "ALTER TABLE risk_assessments ADD CONSTRAINT c_client_fkey FOREIGN KEY (client_id) REFERENCES clients (id) MATCH FULL"
      execute "ALTER TABLE risk_assessments ADD CONSTRAINT c_user_fkey FOREIGN KEY (user_id) REFERENCES users (id) MATCH FULL"
      execute "ALTER TABLE risk_assessments ADD CONSTRAINT c_safety_contract_fkey FOREIGN KEY (safety_contract_id) REFERENCES safety_contracts (id) MATCH FULL"
      execute "ALTER TABLE risk_assessments ADD CONSTRAINT c_followup_service_fkey FOREIGN KEY (followup_service_id) REFERENCES followup_services (id) MATCH FULL"
      execute "ALTER TABLE risk_assessments ADD CONSTRAINT c_risk_assessment_type_fkey FOREIGN KEY (risk_assessment_type_id) REFERENCES risk_assessment_types (id) MATCH FULL"
      execute "ALTER TABLE risk_assessments ADD CONSTRAINT c_risk_assessment_outcome_fkey FOREIGN KEY (risk_assessment_outcome_id) REFERENCES risk_assessment_outcomes (id) MATCH FULL"
      execute "ALTER TABLE allocations ADD CONSTRAINT c_allocations_allocation_service_fkey FOREIGN KEY (allocation_service_id) REFERENCES allocation_services (id) MATCH FULL"
    end
  end


  def self.down
    drop_table  :risk_assessments
    drop_table  :safety_contracts
    drop_table  :risk_assessment_outcomes
    drop_table  :calls_presenting_issues
    drop_table  :calls
    drop_table  :type_of_calls
    drop_table  :referal_sources
    drop_table  :presenting_issues
    drop_table  :location_trusts
    drop_table  :location_towns
    drop_table  :location_postcodes
    drop_table  :length_of_calls
    drop_table  :followup_services
    drop_table  :caller_satisfactions
    drop_table  :call_outs
    drop_table  :call_outcomes
    drop_table  :call_out_types
    drop_table  :call_in_types
    drop_table  :call_in_type_subs
    drop_table  :aware_of_services
    drop_table  :allocations
    drop_table  :allocation_services
    drop_table  :clients
    drop_table  :genders
    drop_table  :risk_assessment_types
    drop_table  :ynnas
    drop_table  :users
  end
end
