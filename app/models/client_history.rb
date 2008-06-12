class ClientHistory < ActiveRecord::Base
  belongs_to  :client

  belongs_to :suicide_assessment,  :class_name => "RiskAssessment", :foreign_key => "suicide_assessment_id"
  belongs_to :selfharm_assessment,  :class_name => "RiskAssessment", :foreign_key => "selfharm_assessment_id"
  belongs_to :drugalcohol_assessment,  :class_name => "RiskAssessment", :foreign_key => "drugalcohol_assessment_id"
  belongs_to :eatingdisorder_assessment,  :class_name => "RiskAssessment", :foreign_key => "eatingdisorder_assessment_id"

  belongs_to :safety_contract
  belongs_to :full_assessment,  :class_name => "RiskAssessment", :foreign_key => "full_assessment_id"
  belongs_to :followup_service

  # This is used in AS list/show for associations (i.e. in the client view)
  def to_label
    "#{created_at}"
  end
end
