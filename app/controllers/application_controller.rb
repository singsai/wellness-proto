class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def current_user
      if session[:email] && session[:shib]  
       u = User.where(email: session[:email])
       @current_user ||= Membership.where(:user_id => u[0].id, :shib => session[:shib] )
      end
    end
    helper_method :current_user
    
    # def authorize
    #   redirect_to login_url, alert: "Not authorized" if current_user.nil?
    # end
end
