require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'is associated to user(sender) and user(receiver)' do
    it { should belong_to(:follower) }
    it { should belong_to(:followed) }
  end
end
