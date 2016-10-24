Rails.application.routes.draw do
  root "movies#index"

  resources :movies #dynamically define the routes:
  # get "/movies"       => "movies#index"
  # post "/movies"      => "movies#create"
  # get "movies/new"    => "movies#new", as: "new_movie"
  # get "/movies/:id/edit"  => "movies#edit", as: "edit_movie"
  # get "/movies/:id"   => "movies#show", as: "movie"
  # patch "/movies/:id" => "movies#update"
  # put "/movies/:id"   => "movies#update"
  # delete "/movies/:id"=> "movies#destroy"

end
