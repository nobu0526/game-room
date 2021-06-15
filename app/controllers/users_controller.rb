class UsersController < ApplicationController

  def edit
  end

  def update
    current_user.update(user_params)
    if current_user update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def following
    @title = "フォロー"
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private
  def user_params
    params.require(:user).permit(:nickname,:email)
  end
end
