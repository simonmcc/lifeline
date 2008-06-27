class LengthOfCall < ActiveRecord::Base

  def to_label
    "#{duration_text}"
  end

end
