get '/questions' do
  @questions = Question.all
  @session = session[:username]
  erb :"questions/index"
end

get '/questions/new' do
  if session[:username]
    @user = session[:username]
    erb :"questions/new_question"
  else
    redirect '/users/login'
  end
end

post '/questions/new/:id' do
  # binding.pry
  new_question = Question.create(title: params[:title], body: params[:body], author_id: session[:username])
  # binding.pry
  redirect "/questions/#{new_question.id}"
end

get '/questions/:id' do
  @session = session[:username]
  @question = Question.find(params[:id])
  @answers = Answer.where(question_id: params[:id])
  @answer_comments = AnswerComment.all
  @question_comments = QuestionComment.all
  erb :"questions/show"
end

post '/questions/:id/upvote' do
  @user = User.find(session[:username])
  @question = Question.find(params[:id])
  new_vote = @user.question_votes.new(value: 1, question: @question)

  # @question.question_votes.create(value: 1, question_id: @question.id, user_id: @user.id)
  if request.xhr?
    if new_vote.save
      @votes = @question.votes
      content_type :json
      @votes.to_json
    else
      status 422
    end
  else
    redirect "/questions/#{@question.id}"
  end
end

post '/questions/:id/downvote' do
  @user = User.find(session[:username])
  @question = Question.find(params[:id])
  new_vote = @user.question_votes.new(value: -1, question: @question)

  # @question.question_votes.create(value: -1, question_id: @user.id, user_id: @user.id)
  if request.xhr?
    if new_vote.save
      @votes = @question.votes
      content_type :json
      @votes.to_json
    else
      status 422
    end
  else
    redirect "/questions/#{@question.id}"
  end
end


post '/questions/:id' do
  @session = session[:username]
  if @session
    #binding.pry
    new_answer = Answer.create(body: params[:body], solver_id: session[:username], question_id: params[:id])
    solver = User.find(new_answer.solver_id).username
    content_type :json
    { solver: solver, body: new_answer.body }.to_json
  else
    status 422
    "You need to be logged in to post comments"
  end
end

post '/questions/:id/question_comment' do
  @session = session[:username]
  if @session
    new_comment = QuestionComment.create(body: params[:body], question_id: params[:id], commentor_id: session[:username])

    commentor = User.find(new_comment.commentor_id).username
    content_type :json
    { commentor: commentor, body: new_comment.body }.to_json
  else
    status 422
    "You need to be logged in to post comments"
  end
end

post '/questions/:id/answer_comment/:id' do
  @session = session[:username]
  if @session
    new_comment = AnswerComment.create(body: params[:body], answer_id: params[:id], commentor_id: session[:username])

    commentor = User.find(new_comment.commentor_id).username
    content_type :json
    { commentor: commentor, body: new_comment.body }.to_json
  else
    status 422
    "You need to be logged in to post comments"
  end
 end

