class PostsController < ApplicationController
  load_and_authorize_resource

  # GET /posts or /posts.json
  def index
    @user = User.first
    @posts = @user.posts.includes(:comments)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.first
  end

  # GET /posts/new
  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  # POST /posts
  def create
    @user = User.first
    @post = @user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_posts_path(@user), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
