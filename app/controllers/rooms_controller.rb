class RoomsController < ApplicationController
 def index
  @users = User.all
 end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if room.destroy
      redirect_to root_path
    else
      render:new
    end
  end
    private

    def room_params
      params.require(:room).permit(:name, user_ids: [])
    end
  end