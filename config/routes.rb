RailsBlog::Application.routes.draw do

  resources :create_posts

  resources :users
  resources :tags
  resources :posts

end
