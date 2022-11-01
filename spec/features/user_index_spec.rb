require 'rails_helper'

RSpec.describe 'user/index', type: :feature do
  
  before(:each) do
    driven_by(:rack_test)
    @user = User.create(name: 'John',
                        picture: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                        bio: 'math teacher')
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
    first(:link, 'See user').click
    expect(page).to have_current_path(user_path(@user))
  end
end
