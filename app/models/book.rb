class Book < ApplicationRecord
  acts_as_paranoid
  
  # validation
  validates :title, presence: true
  validates :isbn, :isbn13, presence: true, uniqueness: true
  validates :list_price, :sell_price, :page_num, numericality: { greater_than: 0 }

  # relationship
  has_one_attached :cover_image

  belongs_to :publisher  
  # publisher_id

  belongs_to :category  

  has_many :comments
  has_many :my_favorites
  has_many :users, through: :my_favorites


  # scopes
  scope :available, -> { where(on_sell: true).where('list_price > 0') }

  def favorited_by?(u)
    MyFavorite.exists?(user: u)
  end
end

