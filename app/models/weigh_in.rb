require 'pry'

class WeighIn < ActiveRecord::Base
  attr_accessible :weight, :membership_id
  
  belongs_to :membership
  
  before_save :set_week
  
  private
    def set_week
      if WeighIn.where(:membership_id => membership_id).empty?
        self.week = 1
      else
        self.week = WeighIn.where(:membership_id => membership_id).last.week + 1
      end 
#      last_week_id = WeighIn.where(:membership_id => )
 #     self.week = "Week #{self.id + 1}"
 #
    end
end