Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'user_address', to: 'users/registrations#new_address'
    post 'user_address', to: 'users/registrations#create_address'
  end
  root 'posts#index'
  resources :users, only: [:show, :destroy]
  get '/mypage' => 'users#mypage'
  get '/mypage/destroy' => 'users#destroy'
  resources :cards, only: [:new]
end
