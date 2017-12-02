post '/questions/:ques_id/answers/:answ_id/upvote' do
  @user = User.find(session[:username])
  @answer = Answer.find(params[:answ_id])
  new_vote = @user.answer_votes.new(value: 1, answer: @answer)
  new_vote.save
  # @question.question_votes.create(value: 1, question_id: @question.id, user_id: @user.id)
  if request.xhr?
    if new_vote.save
      @votes = @answer.votes
      content_type :json
      @votes.to_json
    else
      status 422
    end
  else
    redirect "/questions/#{@question.id}"
  end
end

post '/questions/:ques_id/answers/:answ_id/downvote' do
  @user = User.find(session[:username])
  @answer = Answer.find(params[:answ_id])
  new_vote = @user.answer_votes.new(value: -1, answer: @answer)
  # @question.question_votes.create(value: -1, question_id: @user.id, user_id: @user.id)
  if request.xhr?
    if new_vote.save
      @votes = @answer.votes
      content_type :json
      @votes.to_json
    else
      status 422
    end
  else
    redirect "/questions/#{@question.id}"
  end
end

# post '/questions/:ques_id/answers/:answ_id/best-answer' do
#   @user = User.find(session[:username])
#   @answer = Answer.find(params[:answ_id])
#   @question = @answer.question


# end
