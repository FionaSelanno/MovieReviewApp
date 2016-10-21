Rails.application.routes.draw do
  root "movies#index"

  # resources :movies

  post "/movies"      => "movies#create"
  get "movies/new"    => "movies#new", as: "new_movie"
  get "/movies/:id"   => "movies#show", as: "movie"
  get "/movies/:id/edit"  => "movies#edit", as: "edit_movie"
  patch "movies/:id"  => "movies#update"
  get "/movies"       => "movies#index"


end
