class LocationTown < ActiveRecord::Base

  def to_label
    "#{town_text}"
  end

end
