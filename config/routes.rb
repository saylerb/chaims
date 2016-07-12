Rails.application.routes.draw do
  root to: "artists#index"
  get '/artist/:id', to: "artists#show", as: :artist_show
  
end
