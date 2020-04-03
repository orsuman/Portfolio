class Lawyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  enum profession: {弁護士:1, 司法書士:2, 行政書士:3, 税理士:4}
  enum age: {二十歳代:1, 三十歳代:2, 四十歳代:3, 五十歳代:4, 六十歳以上:5 }

  acts_as_paranoid
end
