class TypeOfCall < ActiveRecord::Base
  def to_label
    if sub_category == ''
      "#{category}"
    else
      "#{sub_category}"
    end
  end

  def self.getCategories
    # Returns an array of strings for the categories

    # Array to hold the categories
    categories = Array.new

    rs = self.find_by_sql "SELECT DISTINCT category FROM type_of_calls ORDER BY id"
    rs.each {|p| categories << p.category }

    categories
  end

end
