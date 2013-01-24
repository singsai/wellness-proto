class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def current_user
      if session[:email] && session[:shib]  
      #   u = User.where(email:session[:email])
      #   #@current_user ||= Membership.where(user_id:u.id, shib:session[:shib])
      # end
       u = User.where(email: session[:email])
       # require 'pry'
       # binding.pry
       @current_user ||= Membership.where(:user_id => u[0].id, :shib => session[:shib] )
     end
      #@current_user ||= Membership.where(:shib => session[:shib]) if session[:shib]
# require pry
# binding.pry
    end
    helper_method :current_user
    
    # def authorize
    #   redirect_to login_url, alert: "Not authorized" if current_user.nil?
    # end
end
