class TypeOfCallController < AuthenticatedApplicationController
  active_scaffold

  # Protect this controller, login required
#  include AuthenticatedSystem
#  before_filter :login_required

  active_scaffold :type_of_call do |config|
    # disable the create/edit fucntionality for the presenting issues
    config.columns.exclude :call
  end

end
