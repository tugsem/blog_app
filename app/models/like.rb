class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', optional: true
  belongs_to :post, foreign_key: 'post_id', counter_cache: true, optional: true

  after_save :update_counter

  def update_counter
    post.increment!(:likesCounter)
  end
end
