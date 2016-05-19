class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :title,
            presence: true
  validates :content,
            presence: true
  validates :user,
            presence: true
  def to_s
    title
  end
end
