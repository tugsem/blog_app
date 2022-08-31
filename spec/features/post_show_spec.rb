require 'rails_helper'

RSpec.describe 'Post/show', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.first
    @post = @user.posts.first
    @comment = @post.comments.first
  end

  it 'It should shows a post\'s title' do
    visit user_posts_path(@user, @post)
    expect(page).to have_content(@post.title)
  end

  it 'It should shows the author of the post' do
    visit user_posts_path(@user, @post)
    expect(page).to have_content(@user.name)
  end

  it 'It should shows the body of the post' do
    visit user_posts_path(@user, @post)
    expect(page).to have_content(@post.text)
  end

  it 'It should describe the user name of each comment' do
    visit user_posts_path(@user, @post)
    expect(page).to have_content(@comment.user.name)
  end

  it 'It shows the comment each comment author left' do
    visit user_posts_path(@user, @post)
    expect(page).to have_content(@comment.text)
  end
end
