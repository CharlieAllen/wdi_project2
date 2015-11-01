class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      redirect_to root_path, notice: "Logged in"
    else
      flash.now.alert = "invalid login credentials"
      render :new
    end
  end

    def destroy
    redirect_to root_path, notice: "Logged out!"
    end
    
end
