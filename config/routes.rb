Rails.application.routes.draw do
  resources :teams
  devise_for :coaches
	HighVoltage.configure do |config|
    config.home_page = 'index'
  end
end
