class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, counter_cache: true, optional: true

  after_save :update_counter
  private
  def update_counter
    post.increment!(:comments_count)
  end
end
