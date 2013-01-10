require 'pry'

class TeamsController < ApplicationController
  def new
    @team = Team.new
    2.times { @team.users.build } 
        
    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @team }
    end    
  end

  def create    
    @team = Team.new(params[:team])
  
    respond_to do |format|
      if @team.save        
        params[:team][:users_attributes].values.map do |member|          
          @membership = Membership.new
          @membership.assign \
           :team_id => @team, 
           :user_id => User.where(:email => member["email"]).last.id, #Change this later since emails should be unique anyway
           :role_id => 0
          @membership.save
        end
        
        format.html { render :action => "new", :notice => 'Team was successfully created.' }
        #format.xml  { render :xml => @team, :status => :created, :location => @team }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @team.errors }
      end
    end
  end
  
  def update
    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @team }
    end    
  end

  # private
  #   def create_membership
  #   end
end