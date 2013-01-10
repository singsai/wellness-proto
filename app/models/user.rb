class User < ActiveRecord::Base  
  #include ActiveModel::ForbiddenAttributesProtection
  #has_secure_password

  attr_accessible :email, :team_id, :memberships_attributes

  belongs_to :team
  has_many :memberships
  # has_many :teams, :through => :memberships 
  
  #accepts_nested_attributes_for :memberships
  
  validates_presence_of :email
  
  #validates :email, presence: true, uniqueness: { case_sensitive: false }
  
#  before_save :create_membership
  
#  before_save { |user| user.email = email.downcase }
#  require 'rufus/mnemo'
#  before_save :create_member_token #:create_remember_token
 
  private
    # def create_membership
    #   require 'pry'
    #   binding.pry
    #   Membership.new(:)
    # end
  
    # def create_member_token       
    #   random_number = Random.rand(100000..999999)
    #   arraytized_string = random_number.to_s.split('')
    #   random_string = arraytized_string.shuffle.join
    #   mnemo = Rufus::Mnemo.from_i(random_string.to_i)
    #   self.member_token = mnemo      
    # end

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
