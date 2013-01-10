# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  email        :string(255)
#  team_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  member_token :string(255)
#

class User < ActiveRecord::Base  
  #has_secure_password
  attr_accessible :email, :team_id, :memberships_attributes

  belongs_to :team
  has_many :memberships
  
  validates_presence_of :email
# validates :email, presence: true, uniqueness: { case_sensitive: false }  
# before_save { |user| user.email = email.downcase }

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
