class CallOutController < AuthenticatedApplicationController
  
  #include ApplicationHelper
  #layout 'application'

  # Protect this controller, login required
  #include AuthenticatedSystem
  #before_filter :login_required

  # Configure ActiveScaffold
  active_scaffold :call_out do |config|

    # Apple some order to the fields being displayed
    config.columns = [:time_of_call, 
                      :client,
                      :call_out_type,
                      :call_outcome,
                      :notes]
    # This hides the "Create New" link for the list view
    config.create.link = nil
    
    # Don't do the sub-form thing on create, just pick from existing entries
    config.columns[:client].form_ui = :auto_complete

    config.columns[:call_outcome].label = " Was Action fully completed?"
    config.columns[:call_outcome].form_ui = :select
    config.columns[:call_out_type].form_ui = :select

    # Make thie notes field a textarea not just text
    config.columns[:notes].label = "Additional Information"
    config.columns[:notes].form_ui = :textarea
    config.columns[:notes].options = { :cols => 60, :rows => 20}
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
 
end

module CallOutHelper

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
