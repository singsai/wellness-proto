require 'pry'
class MembershipsController < ApplicationController
  def show
    @membership = Membership.find(params[:id])
    @weighins = WeighIn.where(:membership_id => @membership.id)
  end
    
  def edit
    @membership = Membership.find(params[:id])
  end
    
  def update
    @membership = Membership.find(params[:id])
    
    if @membership.update_attributes(params[:membership])
      redirect_to edit_membership_path(@membership), notice:"The weight has been edited"
    end
    
    # respond_to do |format|
    # end 
  end
end