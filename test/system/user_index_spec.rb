require 'rails_helper'
​
RSpec.describe 'user/index', type: :system do
  before(:each) do
    driven_by(:rack_test)
    @user = User.first
  end
​
  it "has username" do
    visit users_path
    expect(page).to have_content(@user.name)
  end
​
  it "has profile picture" do
    visit users_path
    expect(page).to have_css("img")
  end
​
  it "has number of posts" do
    visit users_path
    expect(page).to have_content("Number of Posts: #{@user.posts_count}")
  end
​
end