class AddLikesCounterToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :likesCounter, :integer, default: 0
  end
end
