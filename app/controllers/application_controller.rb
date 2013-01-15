class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def current_user
      @current_user ||= Membership.where(:shib => session[:shib]) if session[:shib]
    end
    helper_method :current_user
end
