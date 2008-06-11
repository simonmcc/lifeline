class Call < ActiveRecord::Base
  belongs_to  :referal_source
  belongs_to  :user
  belongs_to  :client
  belongs_to  :gender
  belongs_to  :location_trust
  belongs_to  :type_of_call

  has_and_belongs_to_many :presenting_issues
end
