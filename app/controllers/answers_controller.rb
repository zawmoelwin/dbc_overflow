# get "/answers" do
#   @answers = Answer.all

#   erb :'answers/answers.html'
# end

get "/questions/:question_id/answers/:id" do

  @edit_question_id = params[:question_id]
  @edit_answer_id = params[:id]
  erb :'/answers/_answer_edit_form.html'
end

put "/questions/:question_id/answers/:id" do
  # answer_id = params[:answer_id]
  if current_user.id == Answer.find(params[:id]).answerer_id
  @answer = Question.find(params[:question_id]).answers.find(params[:id])
  @answer.answer = params[:answer]
  @answer.save
   redirect "/questions/#{params[:question_id]}"
 else
  redirect "/login"
  end
end

delete "/questions/:question_id/answers/:id" do

  @answer = Question.find(params[:question_id]).answers.find(params[:id])
  @answer.answer = params[:answer]
  @answer.destroy
   redirect "/questions/#{params[:question_id]}"
end

post "/questions/:id/answers" do

  @question = Question.find(params[:id])
  @answer = Answer.create(answer: params[:answer], answerer_id: current_user.id) #user_id: session[:user_id] )
  @question.answers<<@answer
  redirect "/questions/#{@question.id}"

end


post "/answers/:id/vote" do

  @answer =     Answer.find(params[:id])
  @question_id = @answer.question_id
  if params[:submit_param] == "upvote"

    vote_add(@answer.votes , 1)

    redirect "/questions/#{@question_id}"

  elsif params[:submit_param] == "downvote"
    vote_add(@answer.votes , -1)
    redirect "/questions/#{@question_id}"
  end

end

