class CallController < ApplicationController
  layout 'application'

  # Protect this controller, login required
  include AuthenticatedSystem
  before_filter :login_required

  active_scaffold :call do |config|
    # disable the create/edit fucntionality for the presenting issues
    config.columns[:presenting_issues].ui_type = :select
    config.columns[:referal_source].form_ui = :select
    config.columns[:oktoidentify].form_ui = :checkbox
    config.columns[:throughfirstcall].form_ui = :checkbox
    config.columns[:understoodconfidentiality].form_ui = :checkbox
    config.columns[:usedlifelinebefore].form_ui = :checkbox
    config.columns[:emergency].form_ui = :checkbox
  end

  
end
