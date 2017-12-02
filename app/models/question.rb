class Question < ApplicationRecord
  has_many :answers
  has_many :question_comments
  has_many :question_votes
  has_one :best_answer, class_name: "Answer", foreign_key: 'best_answer_id'
  belongs_to :author, class_name: "User"

  def votes
    question_votes.sum(:value)
  end
end
