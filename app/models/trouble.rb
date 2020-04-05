class Trouble < ApplicationRecord

  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy

  attachment :image

  validates :title, presence: true, length: {maximum: 20}
  validates :body ,presence: true, length: {minimum: 10, maximum: 2000}
  validates :category_id, presence: true
end
