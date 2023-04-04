Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'

  namespace :slack do
    get '/oauth/invite', to: 'oauth#invite'
    get '/oauth/callback', to: 'oauth#callback'
    get '/oauth/success', to: 'oauth#success'

    post '/events/callback', to: 'events#callback'
  end

  namespace :admin do
    resources :users, only: %i[index show edit update destroy]
    resources :entrance_logs, only: %i[index show edit update destroy]

    root to: 'users#index'
  end
end
