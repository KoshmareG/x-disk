class Record < ApplicationRecord
  DISK_SPACE_LIMIT = 10_000_000

  belongs_to :user

  has_one_attached :document

  validates :document, attached: true, size: { less_than_or_equal_to: 4.megabytes }, content_type: [:docx, :xlsx, :zip]
  validate :available_disk_space_for_file

  def name
    document.blob.filename.to_s.gsub(/(\.\w*){1}\z/, '')
  end

  def type
    document.blob.content_type
  end

  private

  def available_disk_space_for_file
    user_used_space =
      Record.
        includes(document_attachment: :blob).
        where(user_id: 2).
        map { |record| record.document.blob.byte_size }.
        sum

    if user_used_space + document.blob.byte_size > DISK_SPACE_LIMIT
      errors.add(:document, I18n.t('errors.records.not_enough_disk_space'))
    end
  end
end
