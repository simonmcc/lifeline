class Call < ActiveRecord::Base
  belongs_to  :referal_source
  belongs_to  :user
  belongs_to  :gender
#  has_one  :location_trust
  has_and_belongs_to_many :presenting_issues
end
