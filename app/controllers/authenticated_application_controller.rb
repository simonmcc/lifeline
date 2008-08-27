# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class AuthenticatedApplicationController < ApplicationController
  include ApplicationHelper
  layout 'session'

  # Protect this controller, login required
  include AuthenticatedSystem
  before_filter :login_required

end
