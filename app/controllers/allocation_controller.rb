class AllocationController < ApplicationController

  layout 'application'

  # Protect this controller, login required
  include AuthenticatedSystem
  before_filter :login_required

  active_scaffold :allocation do |config|
    # Apply some order
    config.columns = [:user,
                      :client,
                      :allocation_service,
                      :date_intervention_ended,
                      :num_of_intervention_session,
                      :allocation_service_note
    ]

    # Stuff we want show in the list/index view
    #config.list.columns = [
    #:client,
    #:created_at,
    #:user,
    #]

    # Hide the create a new record sub-form
    config.columns[:client].form_ui = :auto_complete

    # This makes sure that on an edit of an allocation, the list of counsellors is a drop down
    config.columns[:user].form_ui = :select

    # This hides the user/counsellor field from the create form, as 
    # it is set using the before_create_save method.
    config.create.columns.exclude :user

    config.columns[:allocation_service].label = "Allocation Service"
    config.columns[:allocation_service].form_ui = :select
    
    config.columns[:date_intervention_ended].label = "Date intervention ended"

    config.columns[:num_of_intervention_session].label = "Number of intervention sessions to date?"
    
    config.columns[:allocation_service_note].label = "Any addition notes about the allocation service?"

    # This hides the "Create New" link for the list view
    config.create.link = nil
    config.show.link.page = true
    config.update.link.page = true
    #config.action_links.add 'show', :label => 'Show', :type => :record, :page => true
    
   
  end

  def before_create_save(record)
  # Get the user_id from the logged in user (current_user.login)
    logged_in_user =  User.find(:first, :conditions => ["login = ?", current_user.login])
    record.user_id = logged_in_user.id
             
  # Can we check here to see if client/client_id is nil?
    p record
    if record[:client_id].nil?
      p "what can we look for here?"
    end
  end
  
  # method to populate the type down model_auto_completer for client
    def auto_complete_belongs_to_for_record_client_id
      auto_param = params[:client][:id]
      @results = Client.find(:all,
                             :conditions => ["LOWER(fname) LIKE ?", "%#{auto_param.downcase}%"],
                             :limit => 10
      )
      render :inline => '<%= model_auto_completer_result(@results, :fname) %>'
    end
end

module AllocationHelper
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
end
  
