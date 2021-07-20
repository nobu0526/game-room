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
    @nickname = current_user.nickname
    @user = User.relationships
    @users = User.find(params[:id])

  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
end

def followers
  @user  = User.find(params[:id])
  @users = @user.followers
  render 'show_follower'
end

  private
  def user_params
    params.require(:user).permit(:nickname,:email)
  end
end
