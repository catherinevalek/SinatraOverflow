class Answer < ApplicationRecord
  belongs_to :solver, class_name: "User"
  belongs_to :question
  has_many :answer_comments
  has_many :answer_votes

  def votes
    answer_votes.sum(:value)
  end
end
