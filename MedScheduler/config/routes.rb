Rails.application.routes.draw do

 
  resources :appointments
  resources :specialties
  resources :doctors
  resources :patients
  resources :pharmacies

  get '/analytics', to: 'doctors#analytics'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
