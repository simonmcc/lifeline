class TypeOfCall < ActiveRecord::Base
  has_one :call
  
  def to_label
    "#{category} #{sub_category}"
  end
end
