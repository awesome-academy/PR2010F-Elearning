  class Result < ApplicationRecord
  belongs_to :answer, optional:true
  belongs_to :test
  belongs_to :question
  RESULT_COLOR = ["table-danger","table-success","table-warning","table-primary","table-secondary"]
end
