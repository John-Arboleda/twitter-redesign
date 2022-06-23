require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'is valid with valid attributes' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:fullname).is_at_most(30) }
  end

  describe 'is associated to posts, comments, likes, friendships(senders), and friendships(receivers)' do
    it { should have_many(:opinions) }
    it { should have_many(:comments) }
    it { should have_many(:followings) }
    it { should have_many(:inverse_followings) }
    it { should have_many(:follows) }
  end

  describe 'Validation' do
    it { should validate_length_of(:username).is_at_least(3) }
    it { should_not validate_length_of(:username).is_at_least(2) }
    it { should validate_length_of(:fullname).is_at_most(30) }
    it { should_not validate_length_of(:fullname).is_at_least(3) }
    it { should validate_uniqueness_of(:username) }
  end
end
