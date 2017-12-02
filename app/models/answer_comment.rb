class AnswerComment < ApplicationRecord
  belongs_to :answer
  belongs_to :commentor, class_name: "User"
end
