# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '53f7569608aa8e4ac4dce8abac9870cf'
  
  def verif_admin
    if session[:admin]
      return true
    else
      return false
    end
  end
  
end
