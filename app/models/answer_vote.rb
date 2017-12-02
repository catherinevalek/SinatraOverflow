class AnswerVote < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  validates :answer, uniqueness: { scope: :user }
end
