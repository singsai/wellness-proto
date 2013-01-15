class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if params[:shib] == user.memberships.pluck(:shib).first
      session[:shib] = params[:shib]
      membership = user.memberships.first    
      redirect_to edit_membership_path(membership)
    end
  end
  
  def destroy
    session[:shib] = nil
    redirect_to new_session_path
  end
end