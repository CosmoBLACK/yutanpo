class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_one_attached :profile_image

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create # on: :create = 新規登録時のみバリデーションがかかる。
  validates :password_confirmation, presence: true, on: :create

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end