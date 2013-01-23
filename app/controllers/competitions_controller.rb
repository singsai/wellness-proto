#require 'pry'
class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end
  
  def new    
    @competition = Competition.new
  end
  
  def create
    @competition = Competition.new(params[:competition])    
    respond_to do |format|
      if @competition.save
        format.html { redirect_to new_admin_competition_path, :notice => "Competition added." }
      end
    end        
  end
end