class Test < ApplicationRecord
  belongs_to :student
  belongs_to :course
  has_many :results
  accepts_nested_attributes_for :results
  scope :order_by_date, -> { order(created_at: :desc) }
  scope :created_before, ->{ where('created_at > ?',24.hours.ago)}
end
