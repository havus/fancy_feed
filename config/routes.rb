Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

  root 'articles#index'

  resources :articles, only: [:index, :show, :new, :create]

  namespace :api, format: :json do
    namespace :v1 do
      resources :articles
    end
  end
end
