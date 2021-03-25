class Course < ApplicationRecord
  has_many :questions
  has_many :answers, through: :questions
  has_many :tests
  belongs_to :category
end
