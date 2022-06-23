require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'is associated to user and comments' do
    it { should belong_to(:author) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe 'is valid with valid attributes' do
    it { should validate_presence_of(:text) }
  end
end
