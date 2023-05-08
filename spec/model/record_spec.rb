require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:user) { create(:user) }
  let(:record) { create(:record, user: user) }
  let(:new_record) do
    Record.new(document: Rack::Test::UploadedFile.new('spec/fixtures/test_word_file.docx',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),
      user: user)
  end

  context 'validations' do
    it { validate_attached_of(:document) }
    it { validate_size_of(:document).less_than_or_equal_to(4.megabytes) }
    it { validate_content_type_of(:document).allowing([:docx, :xlsx, :zip]) }
  end

  context 'associations' do
    it { should belong_to(:user) }
  end

  context 'required disk space' do
    it 'should be invalid' do
      allow(user).to receive(:used_disk_space) { 10_000_000 }

      expect(new_record.valid?).to be_falsy
      expect(new_record.errors).not_to be_empty
    end

    it 'should be valid' do
      allow(user).to receive(:used_disk_space) { 9_000_000 }

      expect(new_record.valid?).to be_truthy
      expect(new_record.errors).to be_empty
    end
  end

  describe '#name' do
    it 'returns the file name without the extension' do
      expect(record.name).to eq('test_word_file')
    end
  end

  describe '#type' do
    it 'returns the file type' do
      expect(record.type).to eq('application/vnd.openxmlformats-officedocument.wordprocessingml.document')
    end
  end
end
