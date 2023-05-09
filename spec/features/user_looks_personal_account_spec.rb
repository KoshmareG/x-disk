require 'rails_helper'

RSpec.feature 'user looks personal account', type: :feature do
  let(:user) { create(:user) }
  let!(:record) { create(:record, user: user) }

  before do
    login_as user
    visit account_path(user)
  end

  scenario 'user sees status bar' do
    expect(page).to have_content(user.username)
    expect(page).to have_content("#{I18n.t('records.available')} 9.99 #{I18n.t('records.mb')}")
    expect(page).to have_content(I18n.t('global.download'))
  end

  scenario 'user sees own file' do
    expect(page).to have_content(record.name)
  end
end
