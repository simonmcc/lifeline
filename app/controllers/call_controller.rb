class CallController < AuthenticatedApplicationController

#  include ApplicationHelper
 # layout 'application'

  # Protect this controller, login required
 # include AuthenticatedSystem
 # before_filter :login_required


  active_scaffold :call do |config|

    config.columns = [:user, 
			:created_at,
			:usedlifelinebefore, 
			:direct_call, 
			#:caller_name, 
			:client,
			:understoodconfidentiality, 
			:contact_telephone,
			:emergency, 
			:oktoidentify, 
			:throughfirstcall, 
			:referal_source, 
			:gender, 
			:age,
			:location_trust,
                        :location_town,
                        :location_postcode,
                        :presenting_issues,     # virtual field, part of habtm
			:aware_of_services,
                        :call_in_type,
                        :call_in_type_sub,
                        :furtheractionrequired,
			:caller_satisfaction,
			:length_of_call,
                        :call_in_summary  			
    ]

    config.list.columns = [
			:created_at,
                        :presenting_issues,     # virtual field, part of habtm
                        :user, 
			:length_of_call,
#                        :call_in_type,
			:call_in_summary,
                        :client
			]

    #config.actions.exclude :show
    #config.actions.exclude :update
    config.actions.exclude :delete

    # This hides the "Create New" link for the list view
    config.create.link = nil
    config.show.link.page = true
    config.update.link.page = true
    #config.action_links.add 'show', :label => 'Show', :type => :record, :page => true


    config.columns[:user].form_ui = :select
    config.columns[:user].label = "Counsellor"

    config.columns[:client].form_ui = :auto_complete
    config.columns[:client].label = "Client ID"
    config.columns[:client].inplace_edit = false
    config.columns[:client].options = { :popup => 'true' }

    config.columns[:usedlifelinebefore].label = "Has the caller used LIFELINE before?"

    # Need to overide the form on this...
    config.columns[:direct_call].label = "Is the caller ringing a direct call or are concerned about someone else?"

    config.columns[:understoodconfidentiality].label = "Has anyone from our service explained confidentiality to the caller before?"
    config.columns[:understoodconfidentiality].form_ui = :checkbox

    config.columns[:contact_telephone].label = 'In case the call gets interrupted, is the caller willing to give a contact telephone number?'

    config.columns[:emergency].label = "Is the caller ringing in an emergency?"

    # Need to overide the form on this...
    config.columns[:oktoidentify].label = 'Is it OK to identify the service if LIFELINE rings this number?'

    # Need to overide the form on this...
    config.columns[:throughfirstcall].label = "Did the caller get straight through to LIFELINE first time?"

    config.columns[:referal_source].label = 'How did the caller find out about the LIFELINE services?'
    config.columns[:referal_source].form_ui = :select

    config.columns[:gender].label = 'What gender is the client?'
    config.columns[:gender].form_ui = :select

    config.columns[:age].label = 'What age is the client?'

    config.columns[:location_trust].label ='Where in the country is the caller (or person the caller is concerned about) ringing from (i.e. area)?'
    config.columns[:location_trust].form_ui = :select
    
    config.columns[:location_town].label ='Location of client?'
    config.columns[:location_town].form_ui = :auto_complete

    config.columns[:location_postcode].label ='Clients Postcode?'
    config.columns[:location_postcode].form_ui = :select

    config.columns[:presenting_issues].label = 'Presenting Issues?'
    # disable the create/edit fucntionality for the presenting issues
    # this displays a set of checkboxes for selecting issues
    config.columns[:presenting_issues].form_ui = :select

    config.columns[:aware_of_services].label = 'Is the caller aware of the services offered by LIFELINE?'
    config.columns[:aware_of_services].form_ui = :select

    config.columns[:call_in_type].label = 'Identify the Type of Call In'
    config.columns[:call_in_type].form_ui = :select

    config.columns[:call_in_type_sub].label = 'Subcategory of the Type of Call In'
    config.columns[:call_in_type_sub].form_ui = :select



    config.columns[:furtheractionrequired].label = 'Did the assistance provided adequately address the need of the caller identified when ringing in?'

    config.columns[:caller_satisfaction].label = 'Ask the caller to rate how satisfied s/he was with the service that the LIFELINE provided overall?'
    config.columns[:caller_satisfaction].form_ui = :select
    
    config.columns[:length_of_call].label = 'Length of Call'
    config.columns[:length_of_call].form_ui = :select
    
    config.columns[:call_in_summary].label = 'Summary of Call'
    config.columns[:call_in_summary].form_ui = :textarea
    config.columns[:call_in_summary].options = { :cols => 60, :rows => 20}


  # --USER-- #

    # This is set using the before_create_save method, instead of configurable on create
    config.create.columns.exclude :user
  end

  def before_create_save(record)
    # Get the user_id from the logged in user (current_user.login)
    logged_in_user =  User.find(:first, :conditions => ["login = ?", current_user.login])
    record.user_id = logged_in_user.id

    # did any of our model_auto_completer fields have new/non-existing values?
    if record[:client_id].nil?
      p "New client needs to be created!!"
      p record
      p "New client needs to be created!!"
      p self.params[:record][:client][:text]
    end

  end

  # -- CLIENT -- #

  # method to populate the type down model_auto_completer, but this should really
  # be done with the following doobery:
  # auto_complete_belongs_to_for "record", :client, :to_label
  def auto_complete_belongs_to_for_record_client_id
    auto_param = params[:record][:client][:text]
    @results = Client.find(:all,
                           :conditions => ["LOWER(name) LIKE ?", "%#{auto_param.downcase}%"],
                           :limit => 10
                )
    render :inline => '<%= model_auto_completer_result(@results, :name) %>'
  end 


  # -- TOWN LOCATION -- #

  # method to populate the type down model_auto_complete
  def auto_complete_belongs_to_for_record_location_town_id
    auto_param = params[:record][:location_town][:text]
    @results = LocationTown.find(:all,
                                :conditions => ["LOWER(town_text) LIKE ?", "%#{auto_param.downcase}%"],
                                :limit => 10
                                )
    render :inline => '<%= model_auto_completer_result(@results, :town_text) %>'
  end

  # -- PRESENTING ISSUES -- #

  def update_subcategory_list
    render :text => multi_select_collection("sub-categories", 
                                            PresentingIssue.find(:all, :conditions => ["category = ?", params[:categories]]),
                                            {}, 
                                            :id,
                                            :to_label, 
                                            size=5, "240px")
  end
  
  #def update_toc_subcategory_list
  #  render :text => CY_select_collection("type_of_call", TypeOfCall.find(:all, :conditions => ["category = ?", params[:toc_categories]]), {}, :id, :to_label, 1, '300px')
  #end

  # -- HANGUP --# 

  def hang_up 
    hangup_call = Call.new 
    hangup_call.call_in_type = CallInType.find(:first, :conditions => ["type_text = ?", 'Hang Up'])

    # Get the user_id from the logged in user (current_user.login)
    logged_in_user =  User.find(:first, :conditions => ["login = ?", current_user.login])
    hangup_call.user_id = logged_in_user.id

    hangup_call.save

    redirect_to :action => 'new'
  end

  # -- SILENCE -- #

  def silence 
    silence_call = Call.new
    silence_call.call_in_type = CallInType.find(:first, :conditions => ["type_text = ?", 'Silent Call'])

    # Get the user_id from the logged in user (current_user.login)
    logged_in_user =  User.find(:first, :conditions => ["login = ?", current_user.login])
    silence_call.user_id = logged_in_user.id

    silence_call.save

    redirect_to :action => 'new'
  end

  # -- TESTING CALL -- #

  def wrong_no 
    wrong_no_call = Call.new
    wrong_no_call.call_in_type = CallInType.find(:first, :conditions => ["type_text = ?", 'Testing Call'])

    # Get the user_id from the logged in user (current_user.login)
    logged_in_user =  User.find(:first, :conditions => ["login = ?", current_user.login])
    wrong_no_call.user_id = logged_in_user.id

    wrong_no_call.save

    redirect_to :action => 'new'
  end
  

  #def new_client_from_call
  #  new_client_from_call = Call.new
  #  new_client_from_call.usedlifelinebefore =Usedlifelinebefore.find(:first, :conditions => ["category = ?", 'Yes(known caller)'])
  #  logged_in_user =  User.find(:first, :conditions => ["login = ?", current_user.login])
  #  new_client_from_call.user_id = logged_in_user.id
#
#    new_client_from_call.save
#
#    redirect_to :action =>'new'
#  end


 #def save
 #      save_call = Call.save
 #      save_call.type_of_call = TypeOfCall.find(:first, :conditions => ["category = ?", 'Hang Up'])
 #      # Get the user_id from the logged in user (current_user.login)
 #      logged_in_user =  User.find(:first, :conditions => ["login = ?", current_user.login])
#       hangup_call.user_id = logged_in_user.id
#  
 #      hangup_call.save
 #      
 #      redirect_to :action => 'new'
# end
          

end





module CallHelper

 def self.boolean_column(name, display_true, display_false)
   self.class_eval do
     define_method("#{name}_column") do |record|
       value = record.send(name)
       if value.nil?
         return "-"
       elsif value
         return display_true
       else
         return display_false
       end
     end

   define_method("#{name}_form_column") do |record, input_name|
     select :record, name, [[display_true, true], [display_false, false]], {:selected => @record.send(name), :selected => nil, :prompt => true }
   end

  end

 end

  def self.reference_column(name, reference_display_column)
    self.class_eval do
      define_method("#{name}_form_column") do |record, field|
        select("record", name.to_s,
                Inflector.camelize(name).constantize.find(:all, :order => "id ASC").collect {|r| [r.send(reference_display_column), r.id] },
                { :selected => record.send("#{name}_id"), :prompt => true })
              # { :selected => select_id, :prompt => true })
        end
                        
                        
                       
     end
                      
   end
  # boolean_column(column name, true value, false value). Defines column and form_column methods
  boolean_column :direct_call, "Direct", "Concern for others"
  boolean_column :usedlifelinebefore, "Yes (Known Caller)", "No (New Caller)"
  boolean_column :furtheractionrequired, "Yes - no further action required", "No-action required recorded"
  boolean_column :emergency, "Yes - move to immediate risk assess the situation", "No - continue"
  boolean_column :oktoidentify, "Yes", "No - do not identify the service when ringing"
  boolean_column :throughfirstcall, "Yes", "No - (Call waiting/engaged)"
  
  # Generates *_form_column select lists from reference table
  reference_column :referal_source, :name
  reference_column :location_trust, :name
  reference_column :location_postcode, :postcode_text
  reference_column :length_of_call, :duration_text
  reference_column :type_of_call, :name

  def user_form_column(record, input_name)
    select("call", "user_id", User.find(:all).collect {|u| [u.login, u.id]})
  end


  # -- USED LIFELINE BEFORE -- #

 #def usedlifelinebefore_form_column(record, input_name)
 #   select_id = @record.usedlifelinebefore
#
#    select("record", "usedlifelinebefore",
 #          
 #               [['Yes (Known Caller)', true ], ['No (New Caller)', false]],
#		{ :selected => select_id, :selected => nil, :prompt => true })
  #end  
 # def usedlifelinebefore_column(record)
 #     if record.usedlifelinebefore
 #     "Yes (Known Caller)"
 #   else
 #     "No (New Caller)"
 #   end
    
 # end
  
 # def usedlifelinebefore_column(record)
  #  if record.nil?
  #    "-"
 #     elsif record.usedlifelinebefore
 #     "Yes (Known Caller)"
 #   else
 #     "No (New Caller)"
 #   end
    
 # end
 

  # -- DIRECT CALL -- #

 # def direct_call_form_column(record, input_name)
 #     select("record", "direct_call", [ ['Direct', true ], ['Concern for others', false]],
 #                                            { :selected => @record.direct_call, :selected => nil, :prompt => true  })
 #     
 # end
 # 
 # def direct_call_column(record)
 #   record.direct_call ? "Direct" : "Concern for others"
#
 # end
    
  # -- EMERGENCY -- #

#  def emergency_form_column(record, input_name)
#    select("record", "emergency", [['Yes - move to immediate risk assess the situation', true ],
#                                   ['No - continue',  false ]],
#                                { :selected => @record.emergency, :selected => nil, :prompt => true  })
#  end

 #   def emergency_column(record)
 #   if record.emergency
 #     "Yes-move to immediate risk assess the situation"
 #   else
 #     "No-continue"
 #   end
  
   # def emergency_column(record)
   # if record.emergency
   #   "Yes"
   # else
   #   "No"
   # end
 # end

    
  #end

  # -- OK TO IDENTIFY -- #

 # def oktoidentify_form_column(record, input_name)
 #   select("record", "oktoidentify", [['Yes', true ],
 #                                  ['No - do not identify the service when ringing', false]],
 #                               { :selected => @record.oktoidentify, :selected => nil, :prompt => true  })
 # end
 # 
 # def oktoidentify_column(record)
 #   if record.oktoidentify
 #     "Yes"
 #   else
 #     "No-do not identify the service when ringing"
 #   end
 #   
 # end

  # -- THROUGH FRIST CALL -- #
  
  #def throughfirstcall_form_column(record, input_name)
  #  select("record", "throughfirstcall", [ ['Yes', true ], ['No - (Call waiting/engaged)', false]],
  #                              { :selected => @record.throughfirstcall, :selected => nil, :prompt => true  })
  #end
 # 
 # def throughfirstcall_column(record)
 #   if record.throughfirstcall
 #     "Yes"
 #   else
 #     "No-(Call waiting/engaged)"
 #   end
 #   
 # end
  
  # -- REFERAL SOURCE -- #

#  def referal_source_form_column(record, input_name)
#    select_id = @record.referal_source
#    
#    select("record", "referal_source",
#                    ReferalSource.find(:all, :order => "id ASC").collect {|r| [r.name, r.id] },
#	{ :selected => select_id, :prompt => true })
#  end
#
  # -- LOCATION TRUST -- #

#  def location_trust_form_column(record, input_name)
#      select_id = @record.location_trust
#
#      select("record", "location_trust",
#                        LocationTrust.find(:all, :order => "id ASC").collect {|r| [r.name, r.id] },
#                        { :selected => select_id, :prompt => true })
#  end
#
  # -- LOCATION POSTCODE -- #

#  def location_postcode_form_column(record, input_name)
#        select_id = @record.location_postcode
#
#        select("record", "location_postcode",
#                          LocationPostcode.find(:all, :order => "id ASC").collect {|r| [r.postcode_text, r.id] },
#                      {:selected => select_id, :prompt => true })
#  end

  # -- PRESENTING ISSUES -- #
  
  def presenting_issues_form_column(record, input_name)

    innerHTML = String.new
    innerHTML << "<div style=\"\">"

    # The main category list, cicking on this populates the sub-category list
    innerHTML << "<div style=\"width:230px; float:left\">"
    innerHTML << multi_select_collection("categories", PresentingIssue.getCategories,
                                         {}, :to_s, :to_s)

    innerHTML << observe_field(:categories, :url => { :action => :update_subcategory_list },
               :update => "#{input_name}[sub]",
               :with => 'categories')
    innerHTML << "</div>"
      
    # This is empty until a category is clicked, this is then updated 
    # via an AJAX update from the controller
    innerHTML << "<div id=\"#{input_name}[sub]\" style=\"width:250px; float:left\">"
    innerHTML << multi_select_collection("sub-categories", {}, {}, :to_s, :to_s, 5, "240px")
    innerHTML << "</div>"
    
    innerHTML << "<div style=\"width:100px; float:left\">"
    innerHTML << button_to_function("Add >>", 
                  "f_optionAdd(0,'sub-categories','presenting_issues')")

    innerHTML << button_to_function("<< Remove", 
                  "f_optionRemove(0,'presenting_issues')")
    innerHTML << "</div>"

    innerHTML << "<div id=\"#{input_name}[picked]\" style=\"width:220px%; float:left;\">"
    innerHTML << multi_select_collection("presenting_issues", 
                                         record.presenting_issues,
                                         {}, 
                                         :id, :to_label)
    innerHTML << "</div>"

    innerHTML << "</div>"
    innerHTML 
  end

  # -- CALL IN TYPE -- #

  def call_in_type_form_column(record, input_name)
           select_id = @record.call_in_type

       select("record", "call_in_type",
          CallInType.find(:all, :order => "id ASC").collect {|r| [r.type_text, r.id] },
                         {:selected => select_id, :prompt => true })
  end


  # -- CALL IN TYPE SUB -- #

  def call_in_type_sub_form_column(record, input_name)
       select_id = @record.call_in_type_sub
        select("record", "call_in_type_sub",
        CallInTypeSub.find(:all, :order => "id ASC").collect {|r| [r.sub_text, r.id] },
                        {:selected => select_id, :prompt => true })
  end

  # -- FURTHER ACTION REQUIRED -- #

 # def furtheractionrequired_form_column(record, input_name)
 #   select :record, :furtheractionrequired, 
#		[['Yes - no further action required', false],
#	         ['No - action required recorded', true]],
#		{:selected => @record.furtheractionrequired, :selected => nil, :prompt => true }
#  end
  

#
 # def furtheractionrequired_column(record)
 #   if record.furtheractionrequired
 #     "Yes-no further action required"
 #   else
 #     "No-action required recorded"
 #   end
 #   
 # end

  # -- LENGTH OF CALL -- #

# def length_of_call_form_column(record, input_name)
#        select_id = @record.length_of_call
#
#        select("record", "length_of_call",
#                          LengthOfCall.find(:all, :order => "id ASC").collect {|r| [r.duration_text, r.id] },
#                      {:selected => select_id, :prompt => true })
# end
 
#  def type_of_call_form_column(record, input_name)

    #innerHTML = String.new
    #innerHTML << "<div style=\"\">"

    # The main category list, cicking on this populates the sub-category list
    #innerHTML << "<div style=\"width:230px; float:left\">"
    #innerHTML << CY_select_collection("toc_categories", TypeOfCall.getCategories, {}, :to_s, :to_s, 1, '230px')

    #innerHTML << observe_field(:toc_categories, :url => { :action => :update_toc_subcategory_list },
    #           :update => "#{input_name}[sub]",
    #           :with => 'toc_categories')
    #innerHTML << "</div>"
      
    # This is empty until a category is clicked, this is then updated 
    # via an AJAX update from the controller
    #innerHTML << "<div id=\"#{input_name}[sub]\" style=\"width:300px; float:left\">"
    #innerHTML << CY_select_collection("type_of_call", record.type_of_call, record.type_of_call, :id, :to_label, 1, '300px')
    #innerHTML << "</div>"
    
    #innerHTML << "</div>"
    #innerHTML 
 # end

  # Override the form_ui so that we can prepopulate this field
  def client_form_column(record, input_name)
    if !self.params_for['client_id'].nil?
      # We have defaults to populate from :-)
      client = Client.find(self.params_for['client_id'])
      options = {:hf_value => client.id, :tf_value => client.to_label }
    else
      options = {}
    end

    # although form_ui = auto_complete, we want to play around abit
    # and generate the html ourselves...
    belongs_to_auto_completer :record, :client, :id, options
  end
  
  # Override the form_ui so that we can prepopulate this field
  def location_town_form_column(record, input_name)
    if !self.params_for['location_town_id'].nil?
      # We have defaults to populate from :-)
      location_town = LocationTown.find(self.params_for['location_town_id'])
      options = {:hf_value => location_town.id, :tf_value => location_town.to_label }
    else
      options = {}
    end

    # although form_ui = auto_complete, we want to play around abit
    # and generate the html ourselves...
    belongs_to_auto_completer :record, :location_town, :id, options
  end

  def created_at_column(record)
    record.created_at.strftime("%d-%b-%y&nbsp;%H:%M")
  end

  def understoodconfidentiality_column(record)
    if record.understoodconfidentiality
      'Yes'
    else
      'No'
    end
  end

end
