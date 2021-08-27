class UsersController < ApplicationController
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
      if @user.update(params.require(:user).permit(:user_name, :introduction, :icon))
        flash[:notice] = "情報を更新しました" 
        redirect_to account_path(current_user)
      end  
  end
  
  def show
    @user = User.find(params[:id])
    @room = Room.new
    @rooms = @user.rooms
  end
  
  def entry
    @user = User.find(params[:id])
    @rooms = @user.rooms
  end  
  

end
  
