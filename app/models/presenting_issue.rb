class PresentingIssue < ActiveRecord::Base
  has_and_belongs_to_many :call

  def to_label
    "#{code} #{issue}"
  end
end
