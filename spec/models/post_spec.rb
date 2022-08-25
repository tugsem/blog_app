require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'hello', text: 'This is my first post', user_id: 98) }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'commentsCounter must be integer greater than or equal zero' do
    expect(subject).to be_valid
  end

  it 'likesCounter must be integer greater than or equal zero' do
    subject.likesCounter = -2
    expect(subject).to_not be_valid
  end

  it 'title must not exceed 250 characters' do
    subject.title = 'orem ipsum dolor sit amet, consectetuer adipiscing elit.
    Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
    nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium q'
    expect(subject).to_not be_valid
  end
end
