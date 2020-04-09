class Room < ApplicationRecord
  belongs_to :user
  belongs_to :lawyer

  has_many :messages, dependent: :destroy
end
