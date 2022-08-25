require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'works! (response status correct)' do
      get user_posts_path(1) do
        response = user_posts_path(1)
        expect(response).to be_successful
      end
    end

    it 'works! (renders true template)' do
      get user_posts_path(1) do
        response = user_posts_path(1)
        expect(response).to render_template(:index)
      end
    end

    it 'works! (response body includes correct text)' do
      get user_posts_path(1) do
        response = user_posts_path(1)
        expect(response.body.include?('All posts for a given user')).to be_true
      end
    end
  end

  describe 'GET /show' do
    it 'works! (response status correct)' do
      get user_posts_path(1, 1) do
        response = user_posts_path(1, 1)
        expect(response).to be_successful
      end
    end

    it 'works! (renders true template)' do
      get user_posts_path(1, 1) do
        response = user_posts_path(1, 1)
        expect(response).to render_template(:show)
      end
    end

    it 'works! (now write some real specs)' do
      get user_posts_path(1, 1) do
        response = user_posts_path(1, 1)
        expect(response.body.incluede?('Here is a detailed look for a given post')).to be_true
      end
    end
  end
end
