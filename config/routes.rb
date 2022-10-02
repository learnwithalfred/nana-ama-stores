# frozen_string_literal: true

Rails.application.routes.draw do
  get "search", to: "search#index"
  get "admin_dashboard/index"
  resources :store_taxes
  resources :payments
  resources :taxes
  resources :stores
  resources :assemblies
  resources :communities
  resources :sub_districts
  resources :sectors
  get "errors/not_found"
  get "errors/internal_server_error"
  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable"
  get "/500", to: "errors#internal_server_error", via: :all
  devise_for :users, path: "auth",
    path_names: { sign_in: "login", sign_out: "logout", password: "secret", confirmation: "verification" }
  resources :users
  get "/admin", to: "admin_dashboard#index"
  get "/stores/:id/payment", to: "stores#payment"
  get "/stores/:id/tax", to: "stores#tax"
  root "home#index"
end
