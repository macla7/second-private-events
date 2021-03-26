class SessionsController < ApplicationController
  skip_before_action :authorised, only: [:new, :create, :welcome]
  
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      
      session[:user_id] = @user.id
      redirect_to '/users'
    else
      redirect_to '/login'
    end
  end

  def login
  end

  def page_requires_login
  end
end
