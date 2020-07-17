Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }


  devise_scope :user do
    get 'users/index', to: 'users/registrations#index'
    root 'home#index'
    get "/help", :to => "home#help"
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    post "notes", :to => "notes#create"
    post "note", :to => "notes#destroy"
    post "count", :to => "notes#count"
    post "comment", :to => "comments#create"
    delete "comments/:id",:to => "comments#destroy"
    get "index",:to => "searches#index"

    resources :groups do
      collection do
        get :request_list
      end
      member do
        get :chatroom
        post :invite
        post :invite_reset
        post :join
      end
    end

    resources :product_registrations, only: [:index,:create,:destroy]  do
      collection do
        post :bluk_posting
      end
    end

  end
end
