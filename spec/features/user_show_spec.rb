require 'rails_helper'

RSpec.describe 'user/show', type: :system do
  before(:each) do
    driven_by(:rack_test)
    @user = User.first
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

  it "has bio" do
    visit '/users/17'
    expect(page).to have_content("Bio: #{@user.bio}")
  end

  it "button to show more" do
    visit '/users/17'
    expect(page).to have_content("Show more")
  end
end