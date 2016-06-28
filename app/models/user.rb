class User < ActiveRecord::Base
  has_secure_password
  has_many :assignments
  has_many :roles, through: :assignments

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  def to_s
  	"#{first_name} #{last_name}"  	
  end

  def role?(role)
  roles.any? { |r| r.name.underscore.to_sym == role }
  end

end