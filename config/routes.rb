Rails.application.routes.draw do
  
  # 自動反映
  # get 'reservations/index'
  get 'home/top'
  
  resources:rooms 
  
  resources:accounts
  
  resources:reservations do
    member do
      post 'confirm'
      post 'complete'
      post 'back'
    end
  end 
  
  
# deviseのルーティング変更のためコントローラー作成
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

# deviseのルーティング変更のためコントローラー作成
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  
  # usersはdeviseの下に書かないとuserscontrollerのshowアクションがないとエラーになる。↓
  # resources:users
  # usersコントローラーに追加↓
  resources:users do
    member do
      get 'entry'
    end
  end
  
end
