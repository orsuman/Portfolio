class Inquiry < ApplicationRecord

  enum subject: {ログインできないので確認して欲しい:1, ログインできるよう復元してほしい:2, その他ご利用について:3 }

  validates :subject, presence: true
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :email, presence: true
  validates :sex, inclusion: { in: [true, false] }
  validates :is_user, inclusion: { in: [true, false] }
  validates :content, presence: true, length: { maximum: 500 }
end
