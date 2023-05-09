require 'rails_helper'

RSpec.describe RecordPolicy do
  let(:user) { create(:user) }
  let(:record) { create(:record, user: user) }
  let(:another_user) { create(:user) }

  subject { described_class }

  context 'user can destroy own record' do
    permissions :destroy? do
      it 'allow access for record owner' do
        expect(subject).to permit(user, record)
      end
    end
  end

  context 'another user cannot destroy stranger record' do
    permissions :destroy? do
      it 'forbid access for another user' do
        expect(subject).not_to permit(another_user, record)
      end
    end
  end
end
