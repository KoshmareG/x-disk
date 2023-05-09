require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
  let(:user) { create(:user) }

  describe '#create' do
    context 'when not authorized user' do
      before { expect { post :create }.to change(Record, :count).by(0) }

      it 'redirect to new user session' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when authorized user' do
      before do
        sign_in user

        expect {
          post :create, params: { record: { document: fixture_file_upload('spec/fixtures/test_word_file.docx') } }
        }.to change(Record, :count).by(1)
      end

      it 'it returns status to 302' do
        expect(response.status).to eq(302)
      end
    end
  end

  describe '#destroy' do
    let!(:record) { create(:record, user: user) }
    let(:another_user) { create(:user) }

    context 'when not authorized user' do
      before { expect { delete :destroy, params: { id: record.id } }.to change(Record, :count).by(0) }

       it 'redirect to new user session' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when authorized user' do
      before do
        sign_in user

        expect { delete :destroy, params: { id: record.id } }.to change(Record, :count).by(-1)
      end

      it 'it returns status to 302' do
        expect(response.status).to eq(302)
      end
    end
  end
end
