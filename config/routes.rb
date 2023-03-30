Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/robot/:id/orders', to: 'robot#create'

  # Defines the root path route ("/")
  # root "articles#index"
end
