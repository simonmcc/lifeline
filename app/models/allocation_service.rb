class AllocationService < ActiveRecord::Base
  def to_label
     "#{service_text}"
  end
end
