Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }


  devise_scope :user do
    get 'users/index', to: 'users/registrations#index'
    root 'home#index'
    get "/tutorial_top", :to => "home#tutorial_top"
    get "/tutorial_note", :to => "home#tutorial_note"
    get "/tutorial_note_index", :to => "home#tutorial_note_index"
    get "/tutorial_create_f_item", :to => "home#tutorial_create_f_item"
    get "/tutorial_index_f_item", :to => "home#tutorial_index_f_item"
    get "/tutorial_group_create", :to => "home#tutorial_group_create"
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
    post "favorite_items_destroy", :to => "favorite_items#destroy"

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

    resources :favorite_items, only: [:index,:create,:new]  do
      collection do
        post :post
      end
    end

  end
end
