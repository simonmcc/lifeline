class CallController < ApplicationController
  layout 'application'

  # Protect this controller, login required
  include AuthenticatedSystem
  before_filter :login_required

  active_scaffold :call do |config|

#    config.columns = [:user, :usedlifelinebefore, :direct_call, :caller_name, 
#			:client,
#			:understoodconfidentiality, 
#			:emergency, :contact_telephone,
#			:oktoidentify, :throughfirstcall, :referal_source, :gender, :age,
##			:presenting_issues, :type_of_call]


    config.columns[:user].form_ui = :select
    config.columns[:user].label = "Agent"

    # This isn't right, it should really be a textbox with AJAX
    # typedown lookups, but I have no docs :-)
    config.columns[:client].form_ui = :textarea
    config.columns[:client].label = "Client ID"

    config.columns[:usedlifelinebefore].form_ui = :checkbox
    config.columns[:usedlifelinebefore].label = "Has the caller used LIFELINE before?"

    config.columns[:direct_call].label = "Is the caller ringing a direct call or are concerned about someone else?"

    config.columns[:understoodconfidentiality].label = "Has anyone from our service explained confidentiality to the caller before?"
    config.columns[:understoodconfidentiality].form_ui = :checkbox

    config.columns[:emergency].label = "Is the caller ringing in an emergency?"
    config.columns[:emergency].form_ui = :checkbox

    config.columns[:contact_telephone].label = 'In case the call gest interrupted, is the caller willing to give a contact telephone number?'

    config.columns[:oktoidentify].label = 'Is it OK to identify the service if LIFELINE rings this number?'
    config.columns[:oktoidentify].form_ui = :checkbox

    config.columns[:throughfirstcall].label = "Did the caller get straight through to LIFELINE first time?"
    config.columns[:throughfirstcall].form_ui = :checkbox


    config.columns[:referal_source].label = 'How did the caller find out about the LIFELINE services?'
    config.columns[:referal_source].form_ui = :select

    config.columns[:gender].label = 'What gender is the caller (or person the caller is concerned about)?'
    config.columns[:gender].form_ui = :select

    config.columns[:age].label = 'What age is the caller (or person the caller is concerned about)?'

    config.columns[:location_trust].label = 'Where in the country is the caller (or person the caller is concerned about) ringing from (i.e. nearest town)?'

    config.columns[:presenting_issues].label = 'What issues is the caller (or person the caller is concerned about) presenting with?'
    # disable the create/edit fucntionality for the presenting issues
    config.columns[:presenting_issues].form_ui = :select

    config.columns[:awareofservices_id].label = 'Is the caller aware of the services offered by LIFELINE?'

    config.columns[:type_of_call].label = 'Identify the Type of Call IN'
    config.columns[:type_of_call].form_ui = :select

    config.columns[:furtheractionrequired].label = 'Did the assistance provided adequately address the need of the caller identified when ringing in?'

    config.columns[:caller_satisfaction_id].label = 'Ask the caller to rate how satisfied s/he was with the service that the LIFELINE provided overall?'

    config.columns[:length_of_call_id].label = 'Length of Call'

    # This is set usingf the before_create_save method, instead of configurable on create
    config.create.columns.exclude :user
  end

  def before_create_save(record)
    # Get the user_id from the logged in user (current_user.login)
    logged_in_user =  User.find(:first, :conditions => ["login = ?", current_user.login])
    record.user_id = logged_in_user.id
  end

  
end
