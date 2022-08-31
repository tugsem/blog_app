class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :likes
  has_many :comments
  has_many :posts, dependent: :destroy, foreign_key: :user_id
  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
