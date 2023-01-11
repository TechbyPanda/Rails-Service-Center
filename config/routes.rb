Rails.application.routes.draw do
  get 'admin/dashboard'
  devise_for :users
  root 'static_pages#home'
  get 'my-service/registration', to: 'service_center_owners#new'
  resources :service_center_owners
  resources :service_stations do
    resources :pakages
  end
end
