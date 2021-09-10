Rails.application.routes.draw do
  get 'movies/index'
  get 'movies/show'
  get 'movies/destroy'
  # get 'bookmarks/new'
  # get 'bookmarks/create'
  # get 'bookmarks/destroy'
  # get 'lists/index'
  # get 'lists/show'
  # get 'lists/new'
  # get 'lists/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i[index show new create]
  resources :bookmarks, only: %i[index new create destroy]
end
