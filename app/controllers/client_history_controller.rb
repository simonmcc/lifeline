class ClientHistoryController < ApplicationController
  layout 'application'

  # Protect this controller, login required
  include AuthenticatedSystem
  before_filter :login_required
  
  #auto_complete_for :client, :fname

  active_scaffold :client_history do |config|

    # Apply some order
    config.columns = [:client,
                      :suicide_assessment,
                      :selfharm_assessment,
                      :drugalcohol_assessment,
                      :eatingdisorder_assessment,
                      :safety_contract,
                      :full_assessment,
                      :clinical_consultation_required,
                      :followup_service
                      ]

    config.columns[:client].form_ui = :auto_complete

    config.columns[:suicide_assessment].label = "Was risk of suicide assessed?"
    config.columns[:suicide_assessment].form_ui = :select

    config.columns[:selfharm_assessment].label = "Was risk of self-harm assessed?"
    config.columns[:selfharm_assessment].form_ui = :select

    config.columns[:eatingdisorder_assessment].label = "Was Drug/Alcohol risk assessed?"
    config.columns[:eatingdisorder_assessment].form_ui = :select

    config.columns[:drugalcohol_assessment].label = "Was risk of eating disorder assessed?"
    config.columns[:drugalcohol_assessment].form_ui = :select

    config.columns[:safety_contract].label = "Was risk management/safety contract agreed?"
    config.columns[:safety_contract].form_ui = :select

    config.columns[:full_assessment].label = "Was a full assessment completed?"
    config.columns[:full_assessment].form_ui = :select

    config.columns[:followup_service].label = "Has a follow up service been identified?"
    config.columns[:followup_service].form_ui = :select
  end

  # method to populate the type down model_auto_completer
  def auto_complete_belongs_to_for_record_client_id
    auto_param = params[:client][:id]
    @results = Client.find(:all,
                           :conditions => ["LOWER(fname) LIKE ?", "%#{auto_param.downcase}%"],
                           :limit => 10
                )
    render :inline => '<%= model_auto_completer_result(@results, :fname) %>'
  end 
end

module ClientHistoryHelper

  def XXXclient_form_column(record, input_name)
    text_field_with_auto_complete :client, :name , :skip_style => true
  end

end

