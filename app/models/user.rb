class User < ActiveRecord::Base
  has_secure_password
  has_many :posts, dependent: :destroy

  validates :nick, presence:true,uniqueness:true
  validates :departmant, presence:true

  def to_s
  	"#{nick}"
  end
end
