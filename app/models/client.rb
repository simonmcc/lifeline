class Client < ActiveRecord::Base
  belongs_to  :gender
  #has_many :call
  #has_many :risk_assessment
  #has_many :call_out

  # this used by AS for displaying a refernce to this object
  def to_label
    "#{name}"
  end
end
