class ReservationsController < ApplicationController
  
  
  def index
    @user = current_user
    @reservations = @user.reservations
  end
  
  # def confirm
  #   @room = Room.find(params[:id])
  #     # @roomはルームidの今選択した１つのお部屋情報(room_name intro,price,add,area,image,user_idなど)が入る
  #   @reservation = Reservation.new(reservation_params)
  #     # @reservationはuser_id ck_in ck_out people room_idが入ってる
  #   @reservation.room = @room
  #     #@reservation.roomに↑の@roomの情報が代入された(これは不要かも)
  #   @reservation.nigtht = @reservation.check_out - @reservation.check_in
  #   @reservation.total = @room.room_price * (@reservation.check_out - @reservation.check_in)
  # end
  
  def confirm
    @reservation = current_user.reservations.new(
      check_in: params[:reservation][:check_in],
      check_out: params[:reservation][:check_out],
      people: params[:reservation][:people],
      room_id: params[:room_id]
      )
    @room = Room.find(params[:id])  
    session[:reservation] = @reservation 
    @reservation.nigtht = @reservation.check_out - @reservation.check_in
    @reservation.total = @room.room_price * (@reservation.check_out - @reservation.check_in)
  end  
  
  def create
    @room = Room.find(params[:id]) # **取得できない
    @reservation = Reservation.create!(session[:reservation])
    # @reservation.room_image = @room.image　**取得できない
    # @reservation.introduction = @room.room_introduction　**取得できない
    # @reservation.room_id = @room.id　**取得できない
    if @reservation.save
      flash[:notice] = "予約完了"
      redirect_to reservations_path(@reservation.id)
    else
      render room_path(@reservation.room.id)
    end
  end  
  
  
  private
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :people, :user_id, :room_id)
  end  
  
end  

  # ひとつ前のページに飛ばしたい時↓
  # redirect_to :back

  