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
 belongs_to   :call_in_type
 belongs_to   :call_in_type_sub

  has_and_belongs_to_many :presenting_issues

  def to_label
    "#{created_at} (#{user[:login]})"
  end

  def initialize(attributes = nil)
    @call_start_time = DateTime.now
    super
  end

  def before_create
    self.created_at = @call_start_time
    write_attribute(:call_start_time, @call_start_time)
  end

end
