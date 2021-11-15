Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to:'homes#top'
  devise_for :users

  resources :users, only:[:show,:edit,:update]

  resources :posts, only:[:new,:create,:index,:edit,:update,:destroy] do
    resources :comments, only: [:create, :destroy]
  end

  get '/search', to: 'searchs#search'

end
