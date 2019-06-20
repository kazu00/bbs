Rails.application.routes.draw do
    get 'mypage', to: 'users#me'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks', # コールバック処理
      registrations: 'users/registrations' # 登録 / 編集処理
    }
    root to: 'home#index'
    resources :users, only: %i[new create]
    resources :boards
    resources :comments, only: %i[create destroy]
    
end
