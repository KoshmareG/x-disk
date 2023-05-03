class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: :username

  has_many :records, dependent: :destroy

  validates :username, presence: true, length: { maximum: 15 }
end
