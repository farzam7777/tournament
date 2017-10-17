Rails.application.routes.draw do
  get 'players/index'

  get 'players/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :coaches
	HighVoltage.configure do |config|
    config.home_page = 'index'
  end

  root 'teams#index'

  resources :teams
  resources :players
end
