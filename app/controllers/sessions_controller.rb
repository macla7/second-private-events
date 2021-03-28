class SessionsController < ApplicationController
  skip_before_action :authorised, only: [:new, :create, :welcome]
  
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      flash[:notice] = "Logged in as #{params[:name]}!"
      session[:user_id] = @user.id
      session[:name] = @user.name
      redirect_to '/users'
    else
      redirect_to '/login'
    end
  end

  def login
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to '/welcome'
  end

  def page_requires_login
  end

  def welcome
  end
end
