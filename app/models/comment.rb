class Comment < ApplicationRecord

	belongs_to :lawyer, -> {with_deleted}
	belongs_to :trouble

    has_many :references, dependent: :destroy
    has_many :reference_users, through: :references, source: :user

    def referenced_by?(user)
    	references.where(user_id: user.id).exists?
    end

	validates :comment, presence: true, length: { maximum: 2000 }
end
