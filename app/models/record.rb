class Record < ApplicationRecord
  DISK_SPACE_LIMIT = 10_000_000
  FILES_EXTENSION_REGEXP = /(\.\w*){1}\z/

  belongs_to :user

  has_one_attached :document

  validates :document, attached: true, size: { less_than_or_equal_to: 4.megabytes }, content_type: [:docx, :xlsx, :zip]
  validate :available_disk_space_for_file, if: -> { document.present? }

  def name
    document.blob.filename.to_s.gsub(FILES_EXTENSION_REGEXP, '')
  end

  def type
    document.blob.content_type
  end

  private

  def available_disk_space_for_file
    if user.used_disk_space + document.blob.byte_size > DISK_SPACE_LIMIT
      errors.add(:document, I18n.t('errors.records.not_enough_disk_space'))
    end
  end
end
