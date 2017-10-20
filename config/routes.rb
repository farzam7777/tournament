Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :coaches

  root 'teams#index'

  resources :teams do
    collection do
      get 'my_team'
    end
  end

  resources :players
end
