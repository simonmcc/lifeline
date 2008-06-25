class PresentingIssue < ActiveRecord::Base
#  has_and_belongs_to_many :call

  def to_label
    "#{code} #{issue}"
  end

  def self.getCategories
    # Returns an array of strings for the categories
    
    # Array to hold the categories
    categories = Array.new

    rs = self.find_by_sql "SELECT DISTINCT category FROM presenting_issues ORDER BY id"
    rs.each {|p| categories << p.category }

    categories
  end
end
