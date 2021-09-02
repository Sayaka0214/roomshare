class ReservationsController < ApplicationController
  
  def index
    @user = current_user
    @reservations = @user.reservations
  end
  
  def confirm
    @reservation = current_user.reservations.new(
      check_in: params[:reservation][:check_in],
      check_out: params[:reservation][:check_out],
      people: params[:reservation][:people],
      room_id: params[:room_id]
      )
      session[:reservation] = @reservation
    @room = Room.find(params[:id])
    @reservation.nigtht = @reservation.check_out - @reservation.check_in
    @reservation.total = @room.room_price * (@reservation.check_out - @reservation.check_in)
    if @reservation.invalid?
			redirect_to "/rooms/#{params[:room_id]}"
		end	
  end
  
 
  def back
    @reservation = @current_user.reservations.new(session[:reservation])
		session.delete(:reservation)
		redirect_to "/rentals/#{params[:rental_id]}"
  end
  
  def complete
    @reservation = Reservation.create!(session[:reservation])
		@room = Room.find(params[:id])
		@reservation.room_id = @room.id
		@reservation.room_name = @room.room_name
		@reservation.total = @room.room_price * (@reservation.check_out - @reservation.check_in)
		@reservation.room_introduction = @room.room_introduction
		@reservation.room_image = @room.image
		
		if @reservation.save!
  		flash[:notice] = "お部屋を予約しました"
  		session.delete(:reservation)
  		redirect_to reservations_path
  	else
  	  redirect_to room_path
    end 
  end
  
end  
