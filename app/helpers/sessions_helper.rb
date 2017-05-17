module SessionsHelper

  # creates the session by adding user_id to the session object
  def create_session(user)
    session[:user_id] = user.id
  end

  # ends the session by clearing the user_id on the sessions object
  def destroy_session(user)
    session[:user_id] = nil
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
