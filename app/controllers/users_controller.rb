class UsersController < ApplicationController
  
  # ユーザー情報編集
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  # ユーザー情報更新
  def update
    @user = User.find_by(id: params[:id])
      if @user.update(params.require(:user).permit(:user_name, :introduction, :icon))
        flash[:notice] = "情報を更新しました" 
        redirect_to account_path(current_user)
      end  
  end
  
  # ルーム登録
  def show
    @user = User.find(params[:id])
    @room = Room.new
    # @rooms = @user.rooms これ要らない記述のはず
  end
  
 
  # ユーザー別登録済みルーム一覧ページ
  def entry
    @user = User.find(params[:id])
    @rooms = @user.rooms
  end  
  

end
  
