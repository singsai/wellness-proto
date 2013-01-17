# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  user_id    :integer
#  role_id    :integer
#  shib       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rufus/mnemo'
require 'pry'

class Membership < ActiveRecord::Base  
  include Assignable

  belongs_to :user
  #belongs_to :kountry
  belongs_to :location
  
  has_many :weigh_ins
  accepts_nested_attributes_for :weigh_ins
  
  before_create :create_shib #:create_remember_token
  
  attr_accessible :weigh_ins_attributes, :location_id, :phone_number, :country_code

  validates :phone_number, :format => { :with => /^\d+$/, :message => "Please enter numeric characters only" }, :allow_blank => true
  
  before_validation :check_phone#, :only => :edit
  
  private
  
    def check_phone            
#binding.pry      
      unless phone_number.nil? or phone_number.empty? 
        number = phone_number.dup
        num_check = phone_number.gsub(/\D/,'')
        unless num_check.length > 0
          errors.add :phone_number, "Phone number must be digits only and not nil/empty"
          return false
        end      
#binding.pry      
        #number = "#{country_code}#{number}" unless number.starts_with?(c.country_code)
        number = Phony.normalize(number)

        self.phone_number = number
      end
    end
  
    def create_shib                   
      new_membership_id = Membership.count + 1      
      y = Time.now.strftime("%y")
    	m = Time.now.strftime("%m")
    	d = Time.now.strftime("%d")    	                              
      mnemo = new_membership_id.to_s + y.to_s + m.to_s + d.to_s            
      self.shib = Rufus::Mnemo.from_i(mnemo.to_i)
    end
end
