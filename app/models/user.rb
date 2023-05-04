class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:username]

  has_many :records, dependent: :destroy

  validates :username, presence: true, length: { maximum: 15 }

  def used_disk_space
    records.
      includes(document_attachment: :blob).
      map { |record| record.document.blob.byte_size }.
      sum
  end
end
