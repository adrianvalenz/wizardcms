class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[ new create ]

  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(dashboard_path, notice: "You have logged in successfully")
    else
      flash.now[:alert] = "Log in failed"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, notice: "You have logged out"
  end
end
