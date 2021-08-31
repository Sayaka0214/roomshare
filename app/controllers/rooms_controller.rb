class RoomsController < ApplicationController  
  
  # 検索結果
  def index
    @search= Room.ransack(params[:q])
    @rooms = @search.result(distinct: true)
      if @seach
        @rooms = @search.result(distinct:true)
      end
    @count = @rooms.count
  end
  
  # ルーム登録ボタン
  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "お部屋を登録しました"
      redirect_to entry_user_path(current_user)
    else
      render user_path
    end
  end
  
   # ルーム削除ボタン
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "お部屋を削除しました"
    redirect_to rooms_path
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def back
    redirect_to room_path
  end  
  
  
  def room_params
    params.require(:room).permit(:id, :room_name, :room_introduction, :room_price, :room_area, :room_address, :image, :user_id)
  end
  
  
end 
