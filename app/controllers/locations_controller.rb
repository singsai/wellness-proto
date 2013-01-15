require 'pry'
class LocationsController < ApplicationController
  def new
    @location = Location.new
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @location = Location.new(params[:location])
    
    # binding.pry
    respond_to do |format|
      if @location.save
        format.html { redirect_to new_location_path, :notice => "Location added." }
      end
    end    
  end
  
  def edit
    @location = Location.find(params[:id])
  end
  
  def update
  end
end