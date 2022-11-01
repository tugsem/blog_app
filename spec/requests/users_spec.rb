require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(name: "first user", picture: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png", bio: "Lorem ipsum dolor sit amet.")
  end
  describe 'GET /index' do
    it 'works! (response status correct)' do
      get users_path do
        response = users_path
        expect(response).to be_successful
      end
    end

    it 'works! (renders true template)' do
      get users_path do
        response = users_path
        expect(response).to render_template(:index)
      end
    end

    it 'works! (response body includes correct text)' do
      get users_path do
        response = users_path
        expect(response.body.include?('Here is a list of users')).to be_true
      end
    end
  end

  describe 'GET /show' do
    it 'works! (response status correct)' do
      get user_path(@user) do
        response = user_path(@user)
        expect(response).to be_successful
      end
    end

    it 'works! (renders true template)' do
      get user_path(@user) do
        response = user_path(@user)
        expect(response).to render_template(:show)
      end
    end

    it 'works! (now write some real specs)' do
      get user_path(@user) do
        response = user_path(@user)
        expect(response.body.include?('More information for a given user')).to be_true
      end
    end
  end
end
