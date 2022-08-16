class User < ApplicationRecord
  has_many :likes, :comments, :posts
end
