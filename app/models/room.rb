class Room < ApplicationRecord
  belongs_to :user
  belongs_to :lawyer, -> {with_deleted}

  has_many :messages, dependent: :destroy
end
