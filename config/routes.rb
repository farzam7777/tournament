Rails.application.routes.draw do
  devise_for :coaches
	HighVoltage.configure do |config|
    config.home_page = 'index'
  end

  resources :teams
end
