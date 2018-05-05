Rails.application.routes.draw do
  resources :publishers, only: :show
  post '/shops/:shop_id/books/:id/sell', to: 'shops#sell'
end
