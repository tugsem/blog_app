class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @user = User.first
    @post = Post.find(params[:post_id])
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: } }
    end
  end

  def create
    @user = User.first
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
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

private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
