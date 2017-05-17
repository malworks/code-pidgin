class SessionsController < ApplicationController
  def new
  end

  def create
    # find the user according to the psrams
    user = User.find_by(email: params[:session][:email].downcase)

    # checks if user is not nil and the password match
    if user && user.authenticate(params[:session][:password])
      create_session(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    # logs user out, ends session
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
end
