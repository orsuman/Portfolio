class Category < ApplicationRecord

  has_many :troubles, dependent: :destroy

  validates :name, presence: true
  validates :is_active, inclusion: { in: [true, false] }

end