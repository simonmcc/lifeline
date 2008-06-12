class Client < ActiveRecord::Base
  has_one :call

  # this used by AS for displaying a refernce to this object
  def to_label
    "#{fname}"
  end
end
