require 'rails_helper'

RSpec.describe 'user/posts', type: :system do
  before(:each) do
    driven_by(:rack_test)
    @user = User.first
    @post = @user.posts.first
    @comment = @post.comments.first
  end

  it 'has username' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.name)
  end

  it 'has profile picture' do
    visit user_posts_path(@user)
    expect(page).to have_css('img')
  end

  it 'has number of posts' do
    visit user_posts_path(@user)
    expect(page).to have_content("Number of Posts: #{@user.posts_count}")
  end

  it 'has post title' do
    visit user_posts_path(@user)
    expect(page).to have_content(@post.title)
  end

  it 'has post body' do
    visit user_posts_path(@user)
    expect(page).to have_content(@post.text)
  end

  it 'has comments' do
    visit user_posts_path(@user)
    expect(page).to have_content(@comment.text)
  end

  it 'has comment count' do
    visit user_posts_path(@user)
    expect(page).to have_content("Comments: #{@post.comments_count}")
  end

  it 'has like count' do
    visit user_posts_path(@user)
    expect(page).to have_content("Likes: #{@post.likes_count}")
  end
end
