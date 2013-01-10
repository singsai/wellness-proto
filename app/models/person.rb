# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ActiveRecord::Base
  #include ActiveModel::ForbiddenAttributesProtection
  attr_accessible :name, :phones_attributes

  has_many :phones
  accepts_nested_attributes_for :phones#, allow_destroy: true
  
  validates_presence_of :name
end
