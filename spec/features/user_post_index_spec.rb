require 'rails_helper'

RSpec.describe 'user/posts', type: :system do
  before(:each) do
    driven_by(:rack_test)
    @user = User.create(name: 'John',
                        picture: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                        bio: 'math teacher')
    @post = Post.create(title: 'new post', text: 'Lorem ipsum dolor sit amet.', user: @user)
    @comment = Comment.create(text: 'This is a comment.', user: @user, post: @post)
    visit user_posts_path(@user)
  end

  it 'has username' do
    expect(page).to have_content(@user.name)
  end

  it 'has profile picture' do
    expect(page).to have_css('img')
  end

  it 'has number of posts' do
    expect(page).to have_content("Number of Posts: #{@user.posts_count}")
  end

  it 'has post title' do
    expect(page).to have_content(@post.title)
  end

  it 'has post body' do
    expect(page).to have_content(@post.text)
  end

  it 'has comments' do
    expect(page).to have_content(@comment.text)
  end

  it 'has comment count' do
    expect(page).to have_content("Comments: #{@post.comments_count}")
  end

  it 'has like count' do
    expect(page).to have_content("Likes: #{@post.likes_count}")
  end
  it 'has pagination' do
    click_on('Pagination')
    expect(page).to have_current_path(user_posts_path(@user))
  end
  it 'redirects to user/post/show page' do
    find(:xpath, "//a[@href='#{user_post_path(@user.id, @post.id)}']").click
    expect(page).to have_current_path(user_post_path(@user.id, @post.id))
  end
end
