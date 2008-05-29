class Call < ActiveRecord::Base
  belongs_to  :referal_source
#  has_one  :gender
#  has_one  :location_trust
  has_and_belongs_to_many :presenting_issues
end
