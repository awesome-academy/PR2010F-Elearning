class Question < ApplicationRecord
  belongs_to :course, optional: true
  has_many :answers, dependent: :destroy
  has_many :results
  has_one_attached :img_question
  def avatar_thumbnail
    if img_question.attached?
      img_question.variant(resize: "150x150!").processed
    else
      "/assets/adefault.svg"
    end
  end
  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: ->(attrs) { attrs['content'].blank? }

end
