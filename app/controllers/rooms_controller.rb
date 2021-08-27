class RoomsController < ApplicationController
  
  def index
    @search= Room.ransack(params[:q])
    @rooms = @search.result(distinct: true)
      if @seach
        @rooms = @search.result(distinct:true)
      end
    @count = @rooms.count
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "お部屋を登録しました"
      redirect_to entry_user_path(current_user)
    else
      render user_path
    end  
  end
  
  
  def show
    @room = Room.find(params[:id])
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "お部屋を削除しました"
    redirect_to rooms_path
  end
  
  def room_params
      params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_area, :room_address, :image, :user_id)
  end
  
  
end
