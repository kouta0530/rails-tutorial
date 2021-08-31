class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(user_params)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reddirect_to @user
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
