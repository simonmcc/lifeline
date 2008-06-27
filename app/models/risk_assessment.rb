class RiskAssessment < ActiveRecord::Base
  belongs_to  :client

  belongs_to :risk_assessment_type
  belongs_to :risk_assessment_outcome

  belongs_to :safety_contract
  belongs_to :full_assessment,  :class_name => "RiskAssessmentOutcome", :foreign_key => "full_assessment_id"
  belongs_to :followup_service

  # This is used in AS list/show for associations (i.e. in the client view)
  def to_label
    "#{created_at}"
  end
end
