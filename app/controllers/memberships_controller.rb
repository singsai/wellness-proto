#require 'pry'
class MembershipsController < ApplicationController
  def show
    @membership = Membership.find(params[:id])
    #@weighins = WeighIn.where(:membership_id => @membership.id)
  end
    
  def edit
    @membership = Membership.find(params[:id])    
#binding.pry    
  end
    
  def update 
    @membership = Membership.find(params[:id])
    @membership.country_code = Country.find_country_by_alpha2(params[:kountry][:code]).alpha2    
    
    respond_to do |format|
      if @membership.update_attributes(params[:membership])        
        format.html { redirect_to edit_membership_path(@membership), :notice => "Your information was successfully updated." }
        #redirect_to edit_membership_path(@membership), notice:"The weight has been edited"
      else
        format.html { render :action => "edit", :notice => "Problems son"  }
      end
    end
  end  
end