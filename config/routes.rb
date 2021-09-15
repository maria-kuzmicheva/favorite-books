Rails.application.routes.draw do
  root "start#search"

  
  get "/firstpage", to: "pages#firstpage"
  
  get "/search", to: "search#index"
  
  resources :favorite_books
  get "/search", to: "books#search"

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
