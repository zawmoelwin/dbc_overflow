get "/answers" do
  @answers = Answer.all

  erb :'answers/answers.html'
end


get "/questions/:id" do
  @question = Question.find(params[:id])
  @answers = @question.answers


  erb :'answers/answers.html'
end

post "/questions/:id" do

  @question = Question.find(params[:id])
  @answer = Answer.create(answer: params[:answer], answerer_id: 1) #user_id: session[:user_id] )
  @question.answers<<@answer
  redirect "/questions/#{@question.id}"

end

get "/questions/:question_id/answers/:answer_id" do

  @edit_question_id = params[:question_id]
  @edit_answer_id = params[:answer_id]
  erb :'/answers/_answer_edit_form.html'
end

put "/questions/:question_id/answers/:answer_id" do
  # answer_id = params[:answer_id]
  @answer = Question.find(params[:question_id]).answers.find(params[:answer_id])
  @answer.answer = params[:answer]
  @answer.save
   redirect "/questions/#{params[:question_id]}"
end
