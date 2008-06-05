class GenderController < ApplicationController
  active_scaffold

  active_scaffold :gender do |config|
    # disable the create/edit fucntionality for the presenting issues
    config.columns.exclude :call
  end
end
