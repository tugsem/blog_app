class CommentsController < ApplicationController
def new
  @user = current_user
  @post = Post.find(params[:post_id])
  comment = Comment.new
  respond_to do |format|
    format.html { render :new, locals: { comment: } }
  end
end

def create
  @user = current_user
  @post = Post.find(params[:post_id])
  @comment = Comment.new
  @comment.user_id = @user.id
  @comment.post_id = @post.id
  respond_to do |format|
    format.html do
      if @comment.save
        flash[:notice] = 'Comment successfully created!'
        redirect_to user_posts_path(@user, @post)
      else
        flash.now[:error] = 'Comment cannot be created!'
        render :new, locals: { comment: }
      end
    end
  end
end

def destroy
  @comment = Comment.includes(:user, :post).find(params[:id])
  user = @comment.user
  post = @comment.post

  if @comment.destroy
    flash[:success] = 'Comment deleted!'
  else
    flash.now[:error] = 'Comment not deleted!'
  end
  redirect_to user_post_comments_path(user, post)
end

end