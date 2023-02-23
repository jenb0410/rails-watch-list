Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

    # get '/lists', to: 'lists#index' # all movies
    # get '/lists/new', to: 'lists#new', as: 'new_list' # add list and be directed to show view
    # post 'lists', to: 'lists#create'
    # get '/lists/:id', to: 'lists#show', as: 'list' # details of movie

    get 'bookmarks/new'
    resources :lists do
      resources :bookmarks, only: [:new, :create]
    end
    resources :bookmarks, only: [:destroy]
end
