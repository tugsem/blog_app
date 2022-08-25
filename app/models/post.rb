class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :comments, dependent: :destroy, foreign_key: :post_id
  has_many :likes, dependent: :destroy, foreign_key: :post_id
  belongs_to :user, counter_cache: true, optional: true

  after_save :update_counter

  def update_counter
    user.increment!(:posts_count)
  end

  def recent_comments(post)
    post.comments.order(created_at: :desc).limit(5)
  end
end
