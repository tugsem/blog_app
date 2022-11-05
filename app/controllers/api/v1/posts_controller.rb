module Api
  module V1
    class PostsController < ApplicationController
      #load_and_authorize_resource
      def index
        @user = User.find(params[:user_id])
        @posts = @user.posts.includes(:comments)

        render json: @posts
      end
    end
  end
end
