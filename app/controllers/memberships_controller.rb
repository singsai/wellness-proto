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
    
    respond_to do |format|
      if @membership.update_attributes(params[:membership])
        redirect_to @membership
      end
    end 
  end
end