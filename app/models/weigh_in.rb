require 'pry'

class WeighIn < ActiveRecord::Base
  attr_accessible :weight, :membership_id
  
  belongs_to :membership
  
  before_create :set_week
  
  private
    def set_week
      self.week = WeighIn.where(:membership_id => membership_id).count + 1
      
      # if WeighIn.where(:membership_id => membership_id).empty?
      #   self.week = 1
      # else
      #   self.week = WeighIn.where(:membership_id => membership_id).last.week + 1
      # end 
    end
end