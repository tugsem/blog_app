module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: User.all
      end

      def show
        @user = User.find(params[:id])
        @posts = @user.posts.includes(:comments)
      end
    end
  end
end
