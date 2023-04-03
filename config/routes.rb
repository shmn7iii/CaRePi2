Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'

  get '/slack/invite', to: 'slack#invite'

  namespace :admin do
    resources :users, only: %i[index show edit update destroy]
    resources :entrance_logs, only: %i[index show edit update destroy]

    root to: 'users#index'
  end
end
