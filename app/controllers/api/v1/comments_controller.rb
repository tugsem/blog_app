module Api
  module V1
    class CommentsController < ApplicationController
      def create
        @user = User.find(params[:user_id])
        @post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.user_id = @user.id
        @comment.post_id = @post.id

        if @comment.save
          render json: @comment, status: :created
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
