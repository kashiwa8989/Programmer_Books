class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :book_tags, dependent: :destroy
  has_many :tags, through: :book_tags
  has_one_attached :image

  validates :title, presence: true
  validates :author, presence: true
  validates :introduction, presence: true
  validates :is_draft, presence: true


  def self.search(keyword)
  where(["title like? OR author like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
