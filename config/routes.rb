Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'

  root to: 'slack/oauth#invite'

  namespace :slack do
    get '/oauth/invite', to: 'oauth#invite'
    post '/events/callback', to: 'events#callback'
    get '/oauth/success', to: 'oauth#success'
  end

  namespace :admin do
    root to: 'users#index'

    resources :users, only: %i[index show edit update destroy]
    resources :entrance_logs, only: %i[index show edit update destroy]
  end
end
