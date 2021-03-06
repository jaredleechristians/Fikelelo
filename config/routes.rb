Rails.application.routes.draw do
  resources :vouchers
  resources :devices
devise_for :users, :controllers => { registrations: 'registrations' }

root 'dashboard#dashboard'
  get 'dashboard/help'
  get 'dashboard/terms'
  get 'dashboard/profile'
  get 'dashboard/devices'
  get 'dashboard/transactions'
  get 'dashboard/dashboard'
  get 'dashboard/vouchers'
  get 'dashboard/users'
  get 'dashboard/link_voucher'
  get 'dashboard/add_voucher'
  get 'dashboard/generate_vouchers'
  get 'dashboard/purchase_data'
  get 'dashboard/data_purchase_transaction'
  get 'dashboard/purchase_voice'
  get 'dashboard/voice_purchase_transaction'
  get 'dashboard/transfer_airtime'
  get 'dashboard/airtime_transaction'

match '/dashboard',    to: 'dashboard#dashboard',    via: 'get'
match '/profile', to: 'dashboard#profile', via: 'get'
match '/devices', to: 'dashboard#devices', via: 'get'
match '/transactions',    to: 'dashboard#transactions',    via: 'get'
match '/help',    to: 'dashboard#help',    via: 'get'
match '/terms',    to: 'dashboard#terms',    via: 'get'
match '/admin/vouchers',    to: 'dashboard#vouchers',    via: 'get'
match '/users',    to: 'dashboard#users',    via: 'get'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
