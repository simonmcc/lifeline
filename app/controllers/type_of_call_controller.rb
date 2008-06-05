class TypeOfCallController < ApplicationController
  active_scaffold

  active_scaffold :type_of_call do |config|
    # disable the create/edit fucntionality for the presenting issues
    config.columns.exclude :call
  end

end
