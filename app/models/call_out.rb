class CallOut < ActiveRecord::Base
  belongs_to  :client
  belongs_to  :call_outcome
  belongs_to  :call_out_type

  def to_label
    "#{created_at}"
  end
end
