get '/' do
  @session = session[:username]
  @questions = Question.all
  erb :index
end
