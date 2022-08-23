class PostsController < ApplicationController
  # GET /posts or /posts.json
  def index; end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end
end
