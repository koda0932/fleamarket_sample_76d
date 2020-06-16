Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'user_address', to: 'users/registrations#new_address'
    post 'user_address', to: 'users/registrations#create_address'
  end

  root 'posts#index'
  resources :users do
    collection do
      get :mypage, :logout
    end
  end
  
  resources :cards, only: [:index, :new]
  resources :posts

  resources :posts do
    collection do
      get :search
    end
  end
end

