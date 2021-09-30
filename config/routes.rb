Rails.application.routes.draw do
  root "start#search"
  
  
  get "/firstpage", to: "pages#firstpage"
  
  get "/search", to: "search#index"
  
  resources :favorite_books
  get "/search", to: "books#search"

  resources :users do
    get 'sign_up', on: :collection
    post 'login', on: :collection
  end

  get "/login", to: "start#login"
  
  resources :comments, only: [:create, :destroy]
  
  
  post "/users/log_out", to: "users#log_out"
  
  get "/admin/stat", to: "admin#stat"
  

  #get "/users_accounts", to: "users_accounts"#show

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
