# == Schema Information
#
# Table name: teams
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  competition_id :integer
#

class Team < ActiveRecord::Base
  attr_accessible :name, :users_attributes, :competition_id, :location_id

  belongs_to :competition  
  belongs_to :location

  has_many :memberships

  has_many :users    
  accepts_nested_attributes_for :users
    
  validates_presence_of :name  
end
