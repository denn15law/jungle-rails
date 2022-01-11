class SessionsController < ApplicationController
  def new
  end

  def create
    # user = User.find_by_email(params[:email])
    # if user exists and password correct
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      #save session and redirect
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
      flash.alert = "User not Found"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
