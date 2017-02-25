get "/questions" do
  @questions = Question.all
  erb :'questions/index.html'
end

get "/questions/:id" do
  @question = Question.find(params[:id])
  @answers = @question.answers


  erb :'answers/answers.html'
end

