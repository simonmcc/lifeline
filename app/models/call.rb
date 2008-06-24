class Call < ActiveRecord::Base
  belongs_to  :referal_source
  belongs_to  :user
  belongs_to  :client
  belongs_to  :gender
  belongs_to  :location_trust
  belongs_to  :location_town
  belongs_to  :location_postcode
  belongs_to  :aware_of_services
  belongs_to  :type_of_call
  belongs_to  :length_of_call
  belongs_to  :caller_satisfaction
  
  has_and_belongs_to_many :presenting_issues

  def to_label
    "#{created_at} (#{user[:login]})"
  end
end
