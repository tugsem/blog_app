class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts, dependent: :destroy, foreign_key: :user_id
  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_recent_posts
    Post.order(created_at: :desc).includes(:user).limit(3)
  end
end
