class SessionsController < ApplicationController
  include SessionsHelper
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      log_in @user
      redirect_to @user
    else
      @errors = ["Email/Password is incorrect"]
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to '/users/new'
  end
end
