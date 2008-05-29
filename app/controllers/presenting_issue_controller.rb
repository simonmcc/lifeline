class PresentingIssueController < ApplicationController
  active_scaffold

  active_scaffold :presenting_issue do |config|
    # disable the create/edit fucntionality for the presenting issues
    config.columns.exclude :call
  end
end
