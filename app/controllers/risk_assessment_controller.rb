class RiskAssessmentController < ApplicationController
  layout 'application'

  # Protect this controller, login required
  include AuthenticatedSystem
  before_filter :login_required
  
  active_scaffold :risk_assessment do |config|

    # Apply some order
    config.columns = [:client,
                      :risk_assessment_type,
                      :risk_assessment_outcome,
                      :safety_contract,
                      :clinical_consultation_required,
                      :followup_service
                      ]
                      
    # Stuff we want show in the list/index view
    config.list.columns = [
                      :client,
                      :created_at,
                      :user,
                      :risk_assessment_type,
                      :risk_assessment_outcome,
                      :clinical_consultation_required,
                      ]

    config.columns[:client].form_ui = :auto_complete

    config.columns[:risk_assessment_type].label = "Risk Assessment Type"
    config.columns[:risk_assessment_type].form_ui = :select

    config.columns[:risk_assessment_outcome].label = "Risk Assessment Outcome"
    config.columns[:risk_assessment_outcome].form_ui = :select

    config.columns[:safety_contract].label = "Was risk management/safety contract agreed?"
    config.columns[:safety_contract].form_ui = :select

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

end
