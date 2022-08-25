require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tim', picture: 'www.pp.com', bio: 'Math teacher from Turkey.') }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postCounter must be integer greater than or equal zero' do
    subject.posts_count = 0
    expect(subject).to be_valid
  end
end
