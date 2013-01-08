class TeamsController < ApplicationController
  def new
    @team = Team.new
    5.times { @team.users.build } 
    
    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @team }
    end
    
  end

  def create
    # require 'pry'
    # binding.pry
     @team = Team.new(params[:team])
    respond_to do |format|
      if @team.save
        format.html { render :action => "new", :notice => 'Team was successfully created.' }
        #format.xml  { render :xml => @person, :status => :created, :location => @person }
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

    #   render 'new'
    # else
    #   @team.users.build
    #   render 'new'
    # end
    
      # team_members = params[:team][:users_attributes]
      # map = {}    
      # 
      # team_members.each do |k,v|
      #   map[k] = v
      # end      
      # 
      # @team.transaction do    
      #   map.each_key do |k|
      #     @member = User.create!(:email => map[k][:email], :password => "abcdef")      
      #     @membership = Membership.create(team_id:@team.id, user_id:@member.id, role:"member")        
      # 
      #   end
      # 
      # end
    
    
    
    
#    map.each_key {|key| @team = Team.new(map[key][:email]) }
    
    

#    @team = Team.new(params[:name])
    
    # if params[:add_member]
    #   @team.memberships.build
    # end
    # render :action => 'new'

    # if @team.save
    #   #sign_in @user
    #   #flash[:success] = "Thanks for signing up!"
    #   #redirect_to root_url
    # else
    #   render 'new'
    # end
  
  
end