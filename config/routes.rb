Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  post '/rate' => 'rater#create', :as => 'rate'
  resources :ratings
  root "start#search"
  
  
  get "/firstpage", to: "pages#firstpage"
  
  get "/search", to: "search#index"
  
  resources :favorite_books do
    member do
      get 'to_list'
    end
  end
  get "/search", to: "books#search"

  resources :users do
    get 'sign_up', on: :collection
    post 'login', on: :collection
  end

  get "/login", to: "start#login"
  
  resources :comments, only: [:create, :destroy]
  
  
  post "/users/log_out", to: "users#log_out"
  
  get "/admin/stat", to: "admin#stat"

  
  
  resources :book_lists do
    post   'add_book',       on: :collection 
    delete 'detach_book',    on: :member
  end

  get '/:id' => "shortener/shortened_urls#show"

  


  #get "/users_accounts", to: "users_accounts"#show

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
