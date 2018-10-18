Rails.application.routes.draw do
  resources :internals
  resources :calls
  resources :client_phones
  resources :clients
  resources :call_types
  resources :sectors

  root 'calls#today'
  get '/report', to: 'calls#report'
  get '/show_report', to: 'calls#show_report'
end
