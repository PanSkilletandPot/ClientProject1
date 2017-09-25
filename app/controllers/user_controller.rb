class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    # if @user.id == session[:user_id]
    #   render 'show'
    # else
    #   @errors = ['Error, not authororized']
    #   redirect_with_msg = true
    # end
  end

  private 
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
