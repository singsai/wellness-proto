class User < ActiveRecord::Base  
  #include ActiveModel::ForbiddenAttributesProtection
  #has_secure_password
  attr_accessible :email, :team_id
  
  # has_many :memberships
  # has_many :teams, :through => :memberships 
  belongs_to :team   #testing
  
  validates_presence_of :email
  #validates :email, presence: true, uniqueness: { case_sensitive: false }
  
#  before_save { |user| user.email = email.downcase }
#  before_save :create_remember_token
 
  
  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
