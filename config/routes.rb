Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i[index show edit update destroy]
    resources :entrance_logs, only: %i[index show edit update destroy]

    root to: 'users#index'
  end
  get '/slack/invite', to: 'slack#invite'
end
