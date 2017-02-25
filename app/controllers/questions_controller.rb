get "/questions" do
  @questions = Question.all
  erb :'questions/index.html'
end

get "/questions/:id" do
  @question = Question.find(params[:id])
  @answers = @question.answers


  erb :'answers/answers.html'
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
