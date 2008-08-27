class RiskAssessmentController < AuthenticatedApplicationController
#  layout 'application'

  # Protect this controller, login required
 # include AuthenticatedSystem
 # before_filter :login_required
  
  active_scaffold :risk_assessment do |config|

    # Apply some order
    config.columns = [:client,
                      :risk_assessment_type,
                      :risk_assessment_outcome,
                      :safety_contract,
                      :clinical_consultation_required,
                      :followup_service,
                      :risk_assessment_note                  

    ]
                      
    # Stuff we want show in the list/index view
    config.list.columns = [
                      :client,
                      :created_at,
                      :risk_assessment_type,
                      :risk_assessment_outcome,
                      :clinical_consultation_required,
                      ]
    # This hides the "Create New" link for the list view
    config.create.link = nil

    config.columns[:client].form_ui = :auto_complete

    config.columns[:risk_assessment_type].label = "Risk Assessment Type"
    config.columns[:risk_assessment_type].form_ui = :select

    config.columns[:risk_assessment_outcome].label = "Has risk been fully assessed?"
    config.columns[:risk_assessment_outcome].form_ui = :select

    config.columns[:safety_contract].label = "Was risk management/safety contract agreed?"
    config.columns[:safety_contract].form_ui = :select
    
    config.columns[:clinical_consultation_required].label = "Was clinical consulation required?"
    
    config.columns[:followup_service].label = "Has a follow up service been identified?"
    config.columns[:followup_service].form_ui = :select
 
    config.columns[:risk_assessment_note].label = "Any addition notes for risk assessment?"
    config.columns[:risk_assessment_note].form_ui = :textarea
    config.columns[:risk_assessment_note].options = { :cols => 60, :rows => 20}

  
  end

  # method to populate the type down model_auto_completer
  def auto_complete_belongs_to_for_record_client_id
    auto_param = params[:record][:client][:text]
    @results = Client.find(:all,
                           :conditions => ["LOWER(fname) LIKE ?", "%#{auto_param.downcase}%"],
                           :limit => 10
                )
    render :inline => '<%= model_auto_completer_result(@results, :fname) %>'
  end 
end

module RiskAssessmentHelper

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



  #def clinical_consultation_required_form_column(record, input_name)
  #  select("record", "clinical_consulation_required", [['Yes', true ],
  #                                                     ['No ',  false ]],
  #    { :selected => @record.clinical_consulation_required, :prompt => true  })
  #end

  #def clinical_consultation_required(record)
  #  if record.clinical_consultation_required
  #    "Yes"
  #  else
  #    "No" 
  #  end
  
  #end

end
