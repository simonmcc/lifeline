# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
protect_from_forgery :secret => '982235c45bdb501ce9c09d560bcade9d'

  # Does this negate the above?
  # http://ryandaigle.com/articles/2007/9/24/what-s-new-in-edge-rails-better-cross-site-request-forging-prevention
  #self.allow_forgery_protection = false
layout 'anonymous'
end
