class Team < ActiveRecord::Base
  attr_accessible :name, :users_attributes, :competition_id #, :users

  # has_many :memberships
  # has_many :users, :through => :memberships
  
  has_many :users #testing
  belongs_to :competition
  
  accepts_nested_attributes_for :users
    
  validates_presence_of :name  
end
