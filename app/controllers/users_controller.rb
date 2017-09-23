class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @articles = @user.articles#.visible_to(current_user)
     @unpublished_articles = @articles.where(published: false)
     @published_articles = @articles.where(published: true)
     @favorited_articles = @user.favorited_articles
     @private_articles = @articles.where(private: true)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "Welcome to Code Pidgin #{@user.name}!"
      create_session(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end
end
