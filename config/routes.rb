Rails.application.routes.draw do
  get "pages/dashboard"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "properties#index"
  resources :properties
  resources :tenants do
    resources :leases, only: [:new, :create, :show]
  end
  get "dashboard", to: "pages#dashboard"

  namespace :super_admin do
    resources :landlords, only: [ :index, :show, :update, :destroy ] do
      member do
        patch :approve
        delete :reject
      end
    end
    root to: "dashboard#index"
  end

  namespace :landlord do
    resources :properties do
      resources :leases do
        resources :payments, only: [ :index, :show ]
      end
    end
    root to: "dashboard#index"
  end

    resources :tenant do
      resources :dashboard, only: [ :index, :show ]
      resources :leases, only: [ :index, :show ] do
        resources :payments, only: [ :index, :show ]
      end
      root to: "dashboard#index"
    end
end
