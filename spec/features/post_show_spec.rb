require 'rails_helper'

RSpec.describe 'Post/show', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: "John", picture:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png", bio: "math teacher")
    @post = Post.create(title: "new post", text: "Lorem ipsum dolor sit amet.", user: @user)
    @comment = Comment.create(text: "This is a comment.", user: @user, post: @post)
  end

  it 'should shows a post\'s title' do
    visit user_posts_path(@user, @post)
    expect(page).to have_content(@post.title)
  end

  it ' should shows the author of the post' do
    visit user_posts_path(@user, @post)
    expect(page).to have_content(@user.name)
  end

  it 'should shows the body of the post' do
    visit user_posts_path(@user, @post)
    expect(page).to have_content(@post.text)
  end

  it ' should describe the user name of each comment' do
    visit user_posts_path(@user, @post)
    expect(page).to have_content(@comment.user.name)
  end

  it ' shows the comment each comment author left' do
    visit user_posts_path(@user, @post)
    expect(page).to have_content(@comment.text)
  end
  it 'shows the comments count' do
    visit user_posts_path(@user, @post)
    expect(page).to have_content('Comments: 2')
  end
  it 'shows the likes count' do
    visit user_posts_path(@user, @post)
    expect(page).to have_content('Likes: 0')
  end
end
