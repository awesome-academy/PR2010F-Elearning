class Test < ApplicationRecord
  belongs_to :student
  belongs_to :course
  has_many :results
  accepts_nested_attributes_for :results
end
