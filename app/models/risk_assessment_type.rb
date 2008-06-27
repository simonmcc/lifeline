class RiskAssessmentType < ActiveRecord::Base
  def to_label
    "#{category}"
  end
end
