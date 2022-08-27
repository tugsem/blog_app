class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(post_id: @post.id, user_id: @user.id)

    flash[:notice] = 'Already token' unless @like.save

    redirect_to user_posts_path(@user, @post)
  end
end
