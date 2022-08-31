require 'rails_helper'

RSpec.describe 'user/index', type: :system do
  before(:each) do
    driven_by(:rack_test)
    @user = User.first
    visit users_path
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
  it 'redirects to user/show page' do
    find(:xpath, "//a[@href='#{user_path(@user)}']").click
    expect(page).to have_current_path(user_path(@user))
  end
end
