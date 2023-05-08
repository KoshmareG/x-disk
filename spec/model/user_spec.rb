require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let!(:record) { create(:record, user: user) }
  let(:new_user) { User.new(username: 'Username', email: 'email@example.com', password: 'Password123456') }

  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_most(15) }
    it { should validate_uniqueness_of(:username) }
  end

  context 'associations' do
    it { should have_many(:records) }
  end

  describe '#used_disk_space' do
    it 'returns 12918' do
      expect(user.used_disk_space).to eq(12918)
    end
  end
end
