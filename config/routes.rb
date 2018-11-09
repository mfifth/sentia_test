Rails.application.routes.draw do
  root to: 'home#index'

  get '/home'             => 'home#index'
  get '/results'          => 'home#results'
  post '/process_records' => 'home#process_records'
end
