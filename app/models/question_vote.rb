class QuestionVote < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :question, uniqueness: { scope: :user }
end
