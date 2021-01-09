Rails.application.routes.draw do

 
  resources :appointments
  resources :specialties
  resources :doctors
  resources :patients
  resources :pharmacies
  resources :hospitals

  get '/analytics', to: 'doctors#analytics'
  get '/ratings', to: 'doctors#ratings'
  post '/ratings', to: 'doctors#ratings'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
