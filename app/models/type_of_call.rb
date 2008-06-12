class TypeOfCall < ActiveRecord::Base
  def to_label
    "#{category} #{sub_category}"
  end
end
