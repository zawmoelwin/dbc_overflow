# Login page
get '/login' do
  @error = params[:error]
  erb:'sessions/new.html'
end

# Request to login, redirect to user profile
post '/login' do
  @attempt = params[:user]
  @user = User.authenticate(@attempt[:email], @attempt[:password])
  if @user
    login(@user)
    redirect "users/#{@user.id}"
  else
    @error = "Incorrect email or password"
    redirect "/login?error=#{@error}"
  end
end

# Request to logout, redirect to home page
delete '/logout' do
  logout
  redirect '/'
end