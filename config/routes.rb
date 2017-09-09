Rails.application.routes.draw do
  get 'pages/help'

  get 'pages/terms'

  get 'pages/login'

  get 'pages/profile'

  get 'pages/devices'

  get 'pages/transactions'

  get 'pages/dashboard'

root :to => "pages#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
