class Course < ApplicationRecord
  searchkick
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  has_many :tests
  has_one_attached :img_course
  def avatar_thumbnail
    if img_course.attached?
      img_course.variant(resize: "150x150!").processed
    else
      "/assets/adefault.svg"
    end
  end
  accepts_nested_attributes_for :questions, allow_destroy: true,
                                  reject_if: ->(attrs) { attrs['title'].blank? }
end
