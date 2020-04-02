class Trouble < ApplicationRecord

  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :body ,presence: true, length: {maximum: 1000}
end
