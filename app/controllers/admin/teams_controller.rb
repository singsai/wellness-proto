#require 'pry'
class Admin::TeamsController < ApplicationController
  def index
    @teams = Team.all
  end
  
  def show
    @team = Team.find(params[:id])
  end
  
  def send_week1_reminder    
    @team = Team.find(params[:id])
    respond_to do |format|
      @team.memberships.each do |m|
        m.send_week1_reminder
      end      
      format.html { redirect_to admin_team_path(params[:id]), :notice => "Reminder for Week 1 weigh-in sent" }      
    end        
  end

  def send_week2_reminder    
    @team = Team.find(params[:id])
    respond_to do |format|
      @team.memberships.each do |m|
        m.send_week2_reminder
      end      
      format.html { redirect_to admin_team_path(params[:id]), :notice => "Reminder for Week 2 weigh-in sent" }      
    end        
  end

  def send_week3_reminder    
    @team = Team.find(params[:id])
    respond_to do |format|
      @team.memberships.each do |m|
        m.send_week3_reminder
      end      
      format.html { redirect_to admin_team_path(params[:id]), :notice => "Reminder for Week 3 weigh-in sent" }      
    end        
  end

  def send_week4_reminder    
    @team = Team.find(params[:id])
    respond_to do |format|
      @team.memberships.each do |m|
        m.send_week4_reminder
      end      
      format.html { redirect_to admin_team_path(params[:id]), :notice => "Reminder for Week 4 weigh-in sent" }      
    end        
  end
  
end
