class Book < ApplicationRecord
  # validation
  validates :title, presence: true
  validates :isbn, :isbn13, presence: true, uniqueness: true
  validates :list_price, :sell_price, :page_num, numericality: { greater_than: 0 }

  # relationship
  has_one_attached :cover_image

  belongs_to :publisher  
  # publisher_id

  has_many :comments


  # scopes
  scope :available, -> { where(on_sell: true).where('list_price > 0') }
end

