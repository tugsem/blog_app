class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, foreign_key: 'user_id', counter_cache: true, optional: true

  after_save :update_post_counter

  def update_counter
    user.increment!(:postsCounter)
  end

  def recent_comments(post)
    post.comments.order(created_at: :desc).limit(5)
  end
end
