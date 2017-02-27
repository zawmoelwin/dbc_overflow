get '/questions/:id/comments' do

  @question = Question.find(params[:id])
  @answers = @question.answers
  p params
  p '*' * 100
  @comments = @question.comments
  erb :'answers/answers.html'
end

post '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @comment = Comment.new(comment: params[:comment][:comment],commentor_id: current_user.id )
  @question.comments << @comment
  if @comment.save
    redirect "/questions/#{@question.id}/comments"
  else
    redirect "/questions/#{@question.id}"
  end
end
