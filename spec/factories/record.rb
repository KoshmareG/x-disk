FactoryBot.define do
  factory :record do
    document {
      Rack::Test::UploadedFile.new('spec/fixtures/test_word_file.docx',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document')
    }
  end
end
