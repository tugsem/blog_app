class Post < ApplicationRecord
  has_many :comments, :likes
  belongs_to :user, counter_cache: true
end
