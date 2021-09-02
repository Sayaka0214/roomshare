class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    # ヘッダー検索用
  before_action :search
    def search
      @search = Room.ransack(params[:q])
      @rooms = @search.result
    end
  
  before_action :set_current_user
    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end 
  
  before_action :configure_permitted_parameters, if: :devise_controller? 
  
  def after_sign_in_path_for(resource)
    home_top_path
  end  
  
  def after_sign_out_path_for(resouce)
      home_top_path
  end 
  
  private
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
  end

end  
