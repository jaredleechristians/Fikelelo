Rails.application.routes.draw do
  get 'pages/help'

  get 'pages/terms'

  get 'pages/profile'

  get 'pages/devices'

  get 'pages/transactions'

  get 'pages/dashboard'

match '/dashboard',    to: 'pages#dashboard',    via: 'get'
match '/profile', to: 'pages#profile', via: 'get'
match '/devices', to: 'pages#devices', via: 'get'
match '/transactions',    to: 'pages#transactions',    via: 'get'
match '/help',    to: 'pages#help',    via: 'get'
match '/terms',    to: 'pages#terms',    via: 'get'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
