require 'pry'

class WeighIn < ActiveRecord::Base
  attr_accessible :weight, :membership_id
  
  belongs_to :membership
  
  before_create :set_week, :set_start_date
  
  private
    def set_week
      self.week = WeighIn.where(:membership_id => membership_id).count + 1            
    end
    
    def set_start_date
      competition_start_date = Time.local(2013,"mar",4,8,00,0) #Will later get this date from Competition data      
      weigh_in_count = WeighIn.where(:membership_id => membership_id).count
      
      for n in 0..(weigh_in_count)
        self.start_date = ( competition_start_date.in_time_zone("Eastern Time (US & Canada)") + (n * 7.days) ).beginning_of_week  #if self.week == (n + 1)
        self.end_date = start_date.in_time_zone("Eastern Time (US & Canada)").end_of_week
      end        
    end
end

# .in_time_zone("Eastern Time (US & Canada)")