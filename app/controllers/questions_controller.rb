

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


post "/questions/:id/vote" do

    @question = Question.find(params[:id])
  if params[:submit_param] == "upvote"

    vote_add(@question.votes , 1)

    redirect "/questions/#{@question.id}"

  elsif params[:submit_param] == "downvote"
    vote_add(@question.votes , -1)
    redirect "/questions/#{@question.id}"
  end

end

