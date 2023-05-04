class Record < ApplicationRecord
  belongs_to :user

  has_one_attached :document

  validates :document, attached: true, size: { less_than_or_equal_to: 4.megabytes }, content_type: [:docx, :xlsx, :zip]

  def name
    document.blob.filename.to_s.gsub(/(\.\w*){1}\z/, '')
  end

  def type
    document.blob.content_type
  end
end
