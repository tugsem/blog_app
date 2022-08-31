require 'rails_helper'

RSpec.describe 'user/show', type: :system do
  before(:each) do
    driven_by(:rack_test)
    @user = User.first
    @post = User.first.posts.first
    @comment = @post.comments
  end

  it "has username" do
    visit '/users/17'
    expect(page).to have_content(@user.name)
  end

  it "has profile picture" do
    visit '/users/17'
    expect(page).to have_css("img")
  end

  it "has number of posts" do
    visit '/users/17'
    expect(page).to have_content("Number of Posts: #{@user.posts_count}")
  end

  it "has post title" do
    visit '/users/17'
    expect(page).to have_content(@post.title)
  end

  it "has post body" do
    visit '/users/17'
    expect(page).to have_content(@post.text)
  end

  it "has comments" do
    visit '/users/17'
    expect(page).to have_content(@comment.first.text)
  end

  it "has comment count" do
    visit '/users/17'
    expect(page).to have_content("Comments: #{@post.comments_count}")
  end

  it "has like count" do
    visit '/users/17'
    expect(page).to have_content("Likes: #{@post.likes_count}")
  end
end