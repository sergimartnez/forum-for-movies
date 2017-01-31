Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  "/movies/search", to: "movies#search"
  post "/movies/show_search_results", to: "movies#show_search_results"

  get  "/users/login", to: "users#login"
  post "/users/login_check", to: "users#check_login"

  get  "/movies/create", to: "movies#create"

  get "/movies/:id", to: "movies#show"

  post "/movies/:movie_id/comments/create", to: "movies#create_comment", as: "movie_comments" 

end
