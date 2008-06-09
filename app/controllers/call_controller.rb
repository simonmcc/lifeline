class CallController < ApplicationController
  layout 'application'

  # Protect this controller, login required
  include AuthenticatedSystem
  before_filter :login_required

  active_scaffold :call do |config|

    config.columns = [:user, :usedlifelinebefore, :direct_call, :caller_name, 
			:client,
			:understoodconfidentiality, 
			:emergency, :contact_telephone,
			:oktoidentify, :throughfirstcall, :referal_source, :gender, :age,
			:presenting_issues, :type_of_call]


    # disable the create/edit fucntionality for the presenting issues
    config.columns[:presenting_issues].form_ui = :select

    config.columns[:user].form_ui = :select
    config.columns[:user].label = "Agent"

    # This isn't right, it should really be a textbox with AJAX
    # typedown lookups, but I have no docs :-)
    config.columns[:client].form_ui = :textarea
    config.columns[:client].label = "Client ID"

    config.columns[:referal_source].form_ui = :select

    config.columns[:gender].form_ui = :select

    config.columns[:oktoidentify].form_ui = :checkbox
    config.columns[:oktoidentify].label = 'OK to Identify Lifeline on call back?'

    config.columns[:throughfirstcall].form_ui = :checkbox
    config.columns[:throughfirstcall].label = "Did the caller get through first time?"

    config.columns[:understoodconfidentiality].form_ui = :checkbox
    config.columns[:understoodconfidentiality].label = "Has anyone from our service explained confidentiality to the caller before?"

    config.columns[:usedlifelinebefore].form_ui = :checkbox
    config.columns[:usedlifelinebefore].label = "Has the caller used LIFELINE before?"

    config.columns[:emergency].form_ui = :checkbox

    config.columns[:type_of_call].form_ui = :select

    # This should be set instead of configurable on create
    config.create.columns.exclude :user
  end

  def before_create_save(record)
    # Get the user_id from the logged in user (current_user.login)
    logged_in_user =  User.find(:first, :conditions => ["login = ?", current_user.login])
    record.user_id = logged_in_user.id
  end

  
end
