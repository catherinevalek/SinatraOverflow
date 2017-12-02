class User < ApplicationRecord
  has_many :questions, class_name: "Question", foreign_key: :author_id
  has_many :answers, class_name: "Answer", foreign_key: :solver_id
  has_many :answer_comments, class_name: "AnswerComment", foreign_key: :commentor_id
  has_many :question_comments, class_name: "QuestionComment", foreign_key: :commentor_id
  has_many :answer_votes
  has_many :question_votes

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
