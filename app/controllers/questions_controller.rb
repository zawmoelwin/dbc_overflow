get "/questions" do
  @questions = Question.all
  erb :'questions/index.html'
end

get "/questions/:id" do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @comments = @question.comments
  erb :'answers/answers.html'
end

post '/questions' do 
  new_question = Question.new(question: params[:question],user_id: current_user.id)
  if new_question.save
    redirect "/questions/#{new_question.id}"
  else
    @errors = "Question invalid"
    @questions = Question.all
    erb :'questions/index.html'
  end
end 

