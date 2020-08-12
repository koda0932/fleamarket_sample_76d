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

  resources :posts do
    member do
      get :buy
      post :pay
    end
    collection do
      get :search, :items
    end
  end

  resources :cards, only: [:index, :new, :create, :destroy]

  resources :transaction_rooms, only: :show
  post 'transaction_rooms/:id' => 'transactions#acceptance'
  resources :transaction_messages, only: [:create]
  resources :categories, only: [:index, :show]
  resources :post_brands, only: [:index]
end

