class CallerSatisfaction < ActiveRecord::Base

  def to_label
    "#{satisfaction_text}"
  end

end
