# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  place      :string(255)
#  number     :string(255)
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Phone < ActiveRecord::Base
  attr_accessible :place, :number, :person_id

  belongs_to :person
  
  validates_presence_of :place, :number
end
