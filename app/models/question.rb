class Question < ApplicationRecord
  belongs_to :course, optional: true
  has_many :answers, dependent: :destroy
  has_many :results
  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: ->(attrs) { attrs['content'].blank? }

end
