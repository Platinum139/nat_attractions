class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      #redirect_to attractions_path
      redirect_back_or attractions_path
    else
      flash.now[:danger] = "Невірний email або пароль!"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
