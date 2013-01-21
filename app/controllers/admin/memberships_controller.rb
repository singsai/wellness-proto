require 'pry'
class Admin::MembershipsController < ApplicationController
  def index
    @memberships = Membership.all    
  end
end
