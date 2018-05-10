Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/:repository/forks', to: 'forks#show', as: :forks_show
end
