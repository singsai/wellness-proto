class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def current_user
      @current_user ||= Membership.where(:shib => session[:shib]) if session[:shib]
    end
    helper_method :current_user
    
    # def authorize
    #   redirect_to login_url, alert: "Not authorized" if current_user.nil?
    # end
end
