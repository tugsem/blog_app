class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, counter_cache: true, optional: true

  after_save :update_counter

  def update_counter
    post.increment!(:likes_count)
  end
end
