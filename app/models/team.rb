class Team < ActiveRecord::Base
  attr_accessible :name, :users_attributes, :competition_id #, :users
  #include Assignable

  # has_many :memberships
  # has_many :users, :through => :memberships
  
  has_many :users
  belongs_to :competition
  
  accepts_nested_attributes_for :users
    
  validates_presence_of :name  
end
