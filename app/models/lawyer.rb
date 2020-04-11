class Lawyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :comments
  has_many :rooms

  enum profession: {弁護士:1, 司法書士:2, 行政書士:3, 会計士:4, 税理士:5}
  enum age: {二十歳代:1, 三十歳代:2, 四十歳代:3, 五十歳代:4, 六十歳以上:5 }

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :office, presence: true
  validates :profession, presence: true
  validates :sex, inclusion: { in: [true, false] }
  validates :age, presence: true
  validates :profile, length: { maximum: 75 }
  validates :postal_code, presence: true, length: { is: 7 }
  validates :prefecture, presence: true
  validates :address, presence: true
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/

  acts_as_paranoid
end


