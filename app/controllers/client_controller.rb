class ClientController < ApplicationController
  layout 'application'
  
  # Protect this controller, login required
  include AuthenticatedSystem
  before_filter :login_required

  active_scaffold :client do |config|
    config.columns.exclude :call
  end


end
