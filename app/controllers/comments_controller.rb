class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = @user.id
    @comment.post_id = @post.id
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:notice] = 'Comment successfully created!'
          redirect_to user_posts_url(@comment.user_id, @comment.post_id)
        else
          flash.now[:error] = 'Comment cannot be created!'
          render :new, locals: { comment: }
        end
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = 'Comment deleted!'
    else
      flash.now[:error] = 'Comment not deleted!'
    end
    redirect_to user_posts_path(@user)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
