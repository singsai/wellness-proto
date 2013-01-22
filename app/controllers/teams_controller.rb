require 'pry'

class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
    2.times { @team.users.build } 
        
    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @team }
    end    
  end

  def send_week1_reminder    
    @team = Team.find(params[:id])
    respond_to do |format|
      @team.memberships.each do |m|
        m.send_week1_reminder
      end      
      format.html { redirect_to admin_team_path(params[:id]), :notice => "Yaaa" }      
    end        
  end


  def create    
    @team = Team.new(params[:team])
    @team.competition_id = Competition.first.id
  
    respond_to do |format|
      if @team.save        
#binding.pry        
        params[:team][:users_attributes].values.map do |member|      
          @member = User.where(:email => member["email"])#.last  #Change this later since emails should be unique anyway  
          @membership = Membership.new
          @membership.assign \
           :team_id => @team.id, 
           :user_id => @member.id, 
           :role_id => 0,
           :country_code => "US",
           :location_id => @team.location_id
          @membership.save!
          4.times { @membership.weigh_ins.create }
        end
        
        format.html { render :action => "new", :notice => 'Team was successfully created.' }
        #format.xml  { render :xml => @team, :status => :created, :location => @team }
      else
        format.html { render :action => "new", :notice => "Problems son"  }
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