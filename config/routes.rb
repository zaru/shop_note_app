Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }


  devise_scope :user do
    root 'home#index'
    get "/help", :to => "home#help"
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    post "note", :to => "notes#destroy"
    post "notes", :to => "notes#create"
    post "count", :to => "notes#count"
    post "comment", :to => "comments#create"
    delete "comments/:id",:to => "comments#destroy"
    post "groups/:id/",:to => "groups#update"

    resources :groups

  end
end
