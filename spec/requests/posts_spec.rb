require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'first user',
                        picture: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                        bio: 'Lorem ipsum dolor sit amet.')
    @post = Post.create(title: 'new post', text: 'Lorem ipsum dolor sit amet.', user: @user)
  end
  describe 'GET /index' do
    it 'works! (response status correct)' do
      get user_posts_path(@user) do
        response = user_posts_path(@user)
        expect(response).to be_successful
      end
    end

    it 'works! (renders true template)' do
      get user_posts_path(@user) do
        response = user_posts_path(@user)
        expect(response).to render_template(:index)
      end
    end

    it 'works! (response body includes correct text)' do
      get user_posts_path(@user) do
        response = user_posts_path(@user)
        expect(response.body.include?('All posts for a given user')).to be_true
      end
    end
  end

  describe 'GET /show' do
    it 'works! (response status correct)' do
      get user_posts_path(@user, @post) do
        response = user_posts_path(@user, @post)
        expect(response).to be_successful
      end
    end

    it 'works! (renders true template)' do
      get user_posts_path(@user, @post) do
        response = user_posts_path(@user, @post)
        expect(response).to render_template(:show)
      end
    end

    it 'works! (now write some real specs)' do
      get user_posts_path(@user, @post) do
        response = user_posts_path(@user, @post)
        expect(response.body.include?('Here is a detailed look for a given post')).to be_true
      end
    end
  end
end
