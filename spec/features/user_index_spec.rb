require 'rails_helper'

RSpec.describe 'user/index', type: :feature do
  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Username:')
    end
  end
end