class Result < ApplicationRecord
  belongs_to :answer, optional:true
  belongs_to :test
  belongs_to :question
end
