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

class Membership < ActiveRecord::Base  
  include Assignable

  belongs_to :user
  before_save :create_shib #:create_remember_token

  private
    def create_shib             
      random_number = Random.rand(100000..999999)
      arraytized_string = random_number.to_s.split('')
      random_string = arraytized_string.shuffle.join
      mnemo = Rufus::Mnemo.from_i(random_string.to_i)
      self.shib = mnemo      
    end
end
