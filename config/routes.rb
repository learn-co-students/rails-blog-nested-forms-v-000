RailsBlog::Application.routes.draw do

  resources :users
  resources :tags
  resources :posts
  resources :sparrows
  resources :nests
  resources :eggs

end
