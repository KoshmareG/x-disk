require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:user) { create(:user) }

  describe '#show' do
    context 'when not authorized user' do
      before do
        get :show
      end

      it 'returns status not to 200' do
        expect(response.status).not_to eq(200)
      end

      it 'redirect to new user session' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when authorized user' do
      before do
        sign_in user
        get :show
      end

      it 'it returns status to 200' do
        expect(response.status).to eq(200)
      end
    end
  end
end
