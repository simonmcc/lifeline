class PresentingIssueController < AuthenticatedApplicationController
  active_scaffold

  # Protect this controller, login required
  #include AuthenticatedSystem
  #before_filter :login_required


  active_scaffold :presenting_issue do |config|
    # disable the create/edit fucntionality for the presenting issues
    config.columns.exclude :call
  end
end
