class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :post_id }
  belongs_to :user, optional: true
  belongs_to :post, counter_cache: true, optional: true

  after_save :update_counter

  private

  def update_counter
    post.increment!(:likes_count)
  end
end
