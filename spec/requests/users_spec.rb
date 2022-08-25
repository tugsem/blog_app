require 'rails_helper'

RSpec.describe 'Users', type: :request do
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
      get user_path(1) do
        response = user_path(1)
        expect(response).to be_successful
      end
    end

    it 'works! (renders true template)' do
      get user_path(1) do
        response = user_path(1)
        expect(response).to render_template(:show)
      end
    end

    it 'works! (now write some real specs)' do
      get user_path(1) do
        response = user_path(1)
        expect(response.body.incluede?('More information for a given user')).to be_true
      end
    end
  end
end
