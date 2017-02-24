get '/users/new' do
  erb:'users/new.html'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login(@user)
    redirect "users/#{@user.id}"
  else
    @errors = @user.errors
    redirect "/users/new"
  end
end

# User Profile page
get '/users/:id' do
  @user = User.find(params[:id])
  erb:'users/show'
end