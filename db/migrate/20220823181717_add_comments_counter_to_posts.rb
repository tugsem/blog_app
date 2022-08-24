class AddCommentsCounterToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :commentsCounter, :integer, default: 0
  end
end
