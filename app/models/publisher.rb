class Publisher < ApplicationRecord
  validates :name, :tel, :address, :online, presence: true

  scope :available, -> { where(online: true) }

  has_many :books
end

