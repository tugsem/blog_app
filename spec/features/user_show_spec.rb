require 'rails_helper'

RSpec.describe 'user/show', type: :system do
  before(:each) do
    driven_by(:rack_test)
    @user = User.create(name: "John", picture:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png", bio: "math teacher")
    3.times do
    @post = Post.create(title: "new post", text: "Lorem ipsum dolor sit amet.", user: @user)
    end
  end

  it 'has username' do
    visit user_path(@user)
    expect(page).to have_content(@user.name)
  end

  it 'has profile picture' do
    visit user_path(@user)
    expect(page).to have_css('img')
  end

  it 'has number of posts' do
    visit user_path(@user)
    expect(page).to have_content("Number of Posts: #{@user.posts_count}")
  end

  it 'has bio' do
    visit user_path(@user)
    expect(page).to have_content("Bio: #{@user.bio}")
  end

  it 'button to show more' do
    visit user_path(@user)
    expect(page).to have_content('Show more')
  end
  it 'has first 3 posts' do
    visit user_path(@user)
    expect(page).to have_selector("div[class='card mt-3 p-3']", count: 3)
  end
  it 'redirects to post show page' do
    visit user_path(@user)
    find(:xpath, "//a[@href='#{user_post_path(@user.id, @post.id)}']").click
    expect(page).to have_current_path(user_post_path(@user.id, @post.id))
  end
  it 'redirects to user/posts/index page on click' do
    visit user_path(@user)
    click_on('Show more')
    expect(page).to have_current_path(user_posts_path(@user.id))
  end
end
