class CallController < ApplicationController

  include ApplicationHelper
  layout 'application'

  # Protect this controller, login required
  include AuthenticatedSystem
  before_filter :login_required


  active_scaffold :call do |config|

    config.columns = [:user, 
			:created_at,
			:usedlifelinebefore, 
			:direct_call, 
			# :caller_name, 
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
			:type_of_call,
			:furtheractionrequired,
			:caller_satisfaction,
			:length_of_call
			]

    config.list.columns = [
			:created_at,
            :presenting_issues,     # virtual field, part of habtm
            :user, 
			:length_of_call,
            :type_of_call,
            :direct_call,
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
    config.columns[:user].label = "Agent"

    config.columns[:client].form_ui = :auto_complete
    config.columns[:client].label = "Client ID"

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

    config.columns[:gender].label = 'What gender is the caller (or person the caller is concerned about)?'
    config.columns[:gender].form_ui = :select

    config.columns[:age].label = 'What age is the caller (or person the caller is concerned about)?'

    config.columns[:location_trust].label ='Where in the country is the caller (or person the caller is concerned about) ringing from (i.e. area)?'
    config.columns[:location_trust].form_ui = :select
    
    
    config.columns[:location_town].label ='Where is the caller (or person the caller is concerned about) ringing from (i.e. nearest town)?'
    config.columns[:location_town].form_ui = :auto_complete

    config.columns[:location_postcode].label ='What is the postcode the caller (or person the caller is concerned about) ringing from?'
    config.columns[:location_postcode].form_ui = :select

    config.columns[:presenting_issues].label = 'What issues is the caller (or person the caller is concerned about) presenting with?'
    # disable the create/edit fucntionality for the presenting issues
    # this displays a set of checkboxes for selecting issues
    config.columns[:presenting_issues].form_ui = :select

    config.columns[:aware_of_services].label = 'Is the caller aware of the services offered by LIFELINE?'
    config.columns[:aware_of_services].form_ui = :select

    config.columns[:type_of_call].label = 'Identify the Type of Call IN'
    config.columns[:type_of_call].form_ui = :select

    config.columns[:furtheractionrequired].label = 'Did the assistance provided adequately address the need of the caller identified when ringing in?'

    config.columns[:caller_satisfaction].label = 'Ask the caller to rate how satisfied s/he was with the service that the LIFELINE provided overall?'
    config.columns[:caller_satisfaction].form_ui = :select
    
    config.columns[:length_of_call].label = 'Length of Call'
    config.columns[:length_of_call].form_ui = :select
    
    
    # This is set usingf the before_create_save method, instead of configurable on create
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


  # method to populate the type down model_auto_completer, but this should really
  # be done with the following doobery:
  # auto_complete_belongs_to_for "record", :client, :to_label
  def auto_complete_belongs_to_for_record_client_id
    auto_param = params[:record][:client][:text]
    @results = Client.find(:all,
                           :conditions => ["LOWER(fname) LIKE ?", "%#{auto_param.downcase}%"],
                           :limit => 10
                )
    render :inline => '<%= model_auto_completer_result(@results, :fname) %>'
  end 




  # method to populate the type down model_auto_complete
  def auto_complete_belongs_to_for_record_location_town_id
    auto_param = params[:record][:location_town][:text]
    @results = LocationTown.find(:all,
                                :conditions => ["LOWER(town_text) LIKE ?", "%#{auto_param.downcase}%"],
                                :limit => 10
                                )
    render :inline => '<%= model_auto_completer_result(@results, :town_text) %>'
  end
  


  def update_subcategory_list
    render :text => multi_select_collection("sub-categories", 
    PresentingIssue.find(:all, :conditions => ["category = ?", params[:categories]]),
                            {}, 
                            :id,
                            :to_label, 
                            size=5, "240px")
  end

       def hang_up 
          hangup_call = Call.new 
          hangup_call.type_of_call = TypeOfCall.find(:first, :conditions => ["category = ?", 'Hang Up'])
    
          # Get the user_id from the logged in user (current_user.login)
          logged_in_user =  User.find(:first, :conditions => ["login = ?", current_user.login])
          hangup_call.user_id = logged_in_user.id

          hangup_call.save

          redirect_to :action => 'new'
       end

      def silence 
         silence_call = Call.new
         silence_call.type_of_call = TypeOfCall.find(:first, :conditions => ["category = ?", 'Silent Call'])

         # Get the user_id from the logged in user (current_user.login)
         logged_in_user =  User.find(:first, :conditions => ["login = ?", current_user.login])
         silence_call.user_id = logged_in_user.id

         silence_call.save

        redirect_to :action => 'new'
      end

      def wrong_no 
        wrong_no_call = Call.new
        wrong_no_call.type_of_call = TypeOfCall.find(:first, :conditions => ["category = ?", 'Wrong Number'])
        
        # Get the user_id from the logged in user (current_user.login)
        logged_in_user =  User.find(:first, :conditions => ["login = ?", current_user.login])
        wrong_no_call.user_id = logged_in_user.id
        
        wrong_no_call.save
        
        redirect_to :action => 'new'
      end
end





module CallHelper

  def direct_call_form_column(record, input_name)
      select("record", "direct_call", [ ['Direct', true ], ['Concern for others', false]],
                                             { :selected => @record.direct_call, :prompt => true  })
  end
  
  def direct_call_column(record)
    record.direct_call ? "Direct" : "Concern for others"

  end

  def referal_source_form_column(record, input_name)
    select_id = @record.referal_source
    
    select("record", "referal_source",
                     ReferalSource.find(:all, :order => "id ASC").collect {|r| [r.name, r.id] },
		{ :selected => select_id, :prompt => true })
  end

  def location_trust_form_column(record, input_name)
      select_id = @record.location_trust

      select("record", "location_trust",
                        LocationTrust.find(:all, :order => "id ASC").collect {|r| [r.name, r.id] },
                        { :selected => select_id, :prompt => true })
  end

  def location_postcode_form_column(record, input_name)
        select_id = @record.location_postcode

        select("record", "location_postcode",
                          LocationPostcode.find(:all, :order => "id ASC").collect {|r| [r.postcode_text, r.id] },
                      {:selected => select_id, :prompt => true })
  end

 def length_of_call_form_column(record, input_name)
        select_id = @record.length_of_call

        select("record", "length_of_call",
                          LengthOfCall.find(:all, :order => "id ASC").collect {|r| [r.duration_text, r.id] },
                      {:selected => select_id, :prompt => true })
 end


  def usedlifelinebefore_form_column(record, input_name)
    select_id = @record.usedlifelinebefore

    select("record", "usedlifelinebefore",
                [['Yes (Known Caller)', true ], ['No (New Caller)', false]],
		{ :selected => select_id, :prompt => true })
  end  
  
  def usedlifelinebefore_column(record)
    if record.usedlifelinebefore
      "Yes (Known Caller)"
    else
      "No (New Caller)"
    end
    
  end

  def furtheractionrequired_form_column(record, input_name)
    select :record, :furtheractionrequired, 
		[['Yes - no further action required', false],
	         ['No - action required recorded', true]],
		{ :prompt => true, :selected => @record.furtheractionrequired }
  end
  
  def emergency_form_column(record, input_name)
    select("record", "emergency", [['Yes - move to immediate risk assess the situation', true ],
                                   ['No - continue',  false ]],
                                { :selected => @record.emergency, :prompt => true  })
  end

    def emergency_column(record)
    if record.emergency
      "Yes-move to immediate risk assess the situation"
    else
      "No-continue"
    end
    
  end

  def oktoidentify_form_column(record, input_name)
    select("record", "oktoidentify", [['Yes', true ],
                                   ['No - do not identify the service when ringing', false]],
                                { :selected => @record.oktoidentify, :prompt => true  })
  end
  
  def oktoidentify_column(record)
    if record.oktoidentify
      "Yes"
    else
      "No-do not identify the service when ringing"
    end
    
  end

  def throughfirstcall_form_column(record, input_name)
    select("record", "throughfirstcall", [ ['Yes', true ], ['No - (Call waiting/engaged)', false]],
                                { :selected => @record.throughfirstcall, :prompt => true  })
  end
  
  def throughfirstcall_column(record)
    if record.throughfirstcall
      "Yes"
    else
      "No-(Call waiting/engaged)"
    end
    
  end
  
  def furtheractionrequired_column(record)
    if record.furtheractionrequired
      "Yes-no further action required"
    else
      "No-action required recorded"
    end
    
  end

  def user_form_column(record, input_name)
    select("call", "user_id", User.find(:all).collect {|u| [u.login, u.id]})
  end

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

  def direct_call_column(record)
    record.direct_call ?  "Direct" : "Concern for others"
  end

  def emergency_column(record)
    if record.emergency
      "Yes"
    else
      "No"
    end
  end

end
