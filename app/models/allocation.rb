class Allocation < ActiveRecord::Base

  belongs_to  :client
  belongs_to  :user
  belongs_to  :allocation_service

  def to_label
    "#{created_at}"
  end
end
