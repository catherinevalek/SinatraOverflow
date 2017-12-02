class QuestionComment < ApplicationRecord
  belongs_to :question
  belongs_to :commentor, class_name: "User"

end
