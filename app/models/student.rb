class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  has_one_attached :avatar
  has_many :tests
  has_many :results, through: :tests
  has_many :notifications
  has_many :likes, dependent: :destroy

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
      "/assets/adefault.svg"
    end
  end

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |student|
    student.email = auth.info.email
    student.password = Devise.friendly_token[0, 20]
    student.name = auth.info.name   # assuming the student model has a name
    # student.avatar = auth.info.image # assuming the student model has an image
  end
end
end
