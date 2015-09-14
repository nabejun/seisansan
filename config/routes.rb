Rails.application.routes.draw do
  resources :samples

  resources :koutsuhis do
    member do
      get "user_koutsuhis" => "koutsuhis#user_koutsuhi_index"
    end  
  end

  resources :users do
    member do
      get "user_koutsuhis" => "user_koutsuhis#user_koutsuhi_index"
    end
  end

  get "sign_up" => "koutsuhis#index"
  get "sign_in" => "user_sessions#new"

  resource :user_session, only: :create
  delete "sign_out" => "user_sessions#destroy"



 # root 'koutsuhis#index'

end
