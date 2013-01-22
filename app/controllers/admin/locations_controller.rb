class Admin::LocationsController < ApplicationController
  def new
    @location = Location.new
    
    respond_to do |format|
      format.html
    end
  end  
end