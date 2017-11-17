RailsBlog::Application.routes.draw do
  root 'posts#new'
  resources :users
  resources :tags
  resources :posts

end
