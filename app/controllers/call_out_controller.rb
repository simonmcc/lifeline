class CallOutController < ApplicationController
  layout 'application'

  # Protect this controller, login required
  include AuthenticatedSystem
  before_filter :login_required

  # enable type-down look on client field
  #auto_complete_belongs_to_for :call_out, :client, :name

  def auto_complete_belongs_to_for_call_out_client_name
    @clients = Client.find( :all,
                            :conditions => ['LOWER(name) LIKE ?', "%#{params[:client][:name]}%"],
                            :limit => 10
                          )
    render :inline => '<%= model_auto_completer_result(@clients, :to_label) %>'
  end


  
  # Configure ActiveScaffold
  active_scaffold :call_out do |config|

    # Apple some order to the fields being displayed
    config.columns = [:time_of_call, 
                      :client,
                      :call_outcome_id,
                      :call_out_type,
                      :notes]
   
    
    # Don't do the sub-form thing on create, just pick from existing entries
    config.columns[:client].form_ui = :auto_complete
    config.columns[:client].form_ui = :select
    config.columns[:call_out_type].form_ui = :select

    # Make thie notes field a textarea not just text
    config.columns[:notes].label = "Additional Information"
    config.columns[:notes].form_ui = :textarea
    config.columns[:notes].options = { :cols => 60, :rows => 20}
  end
 
end

module CallOutHelper

  def XXXclient_form_column(record, input_name)
    # This standard string based auto_complete
    #text_field_with_auto_complete :client, :name , :skip_style => true
    
    # id based autocomplete
    # http://agilewebdevelopment.com/plugins/model_auto_completer
    belongs_to_auto_completer :call_out, :client, :name
  end
  
end

