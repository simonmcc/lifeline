class LocationPostcode < ActiveRecord::Base

def to_label
    "#{postcode_text}"
end


end
