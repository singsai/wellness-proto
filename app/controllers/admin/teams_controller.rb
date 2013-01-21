require 'pry'
class Admin::TeamsController < ApplicationController
  def index
    @teams = Team.all
  end
  
  def show
    @team = Team.find(params[:id])
  end
  
  def send_reminder    
    @team = Team.find(params[:id])
    respond_to do |format|
      @team.memberships.each do |m|
        m.send_first_reminder
      end      
      format.html { redirect_to admin_team_path(params[:id]), :notice => "Yaaa" }      

      # if @team.memberships             
      #   format.html { redirect_to admin_team_path(params[:id]), :notice => "Yaaa" }
      # else
      #   format.html { render :action => "edit", :notice => "Problems son"  }
      # end
    end        
  end
end
