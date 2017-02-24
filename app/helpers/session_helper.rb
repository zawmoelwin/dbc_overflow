helpers do
  # Login a user
  def login(user)
    session[:user_id] = user.id
  end
  def logout
    session.destroy
  end
  # Fetch current user
  def current_user
    @user = User.find_by(id: session[:user_id])
  end
end